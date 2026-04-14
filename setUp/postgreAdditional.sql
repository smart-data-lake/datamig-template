DROP VIEW IF EXISTS data_objects ;
DROP VIEW IF EXISTS index_size ;
DROP VIEW IF EXISTS table_size ;
DROP FUNCTION if EXISTS get_data_object;
DROP FUNCTION if EXISTS get_data_objects;
DROP FUNCTION IF EXISTS object_size ;


CREATE OR REPLACE FUNCTION object_size(relkindfilter character[])
 RETURNS TABLE(scheme text, object_name text, row_estimate real, total_bytes bigint, total_size text, object_bytes bigint, object_size text, index_bytes bigint, index_size text, toast_bytes bigint, toast_size text)
 LANGUAGE sql
AS $function$
WITH RECURSIVE schema_filter AS (
 SELECT pg_namespace.oid
       ,pg_namespace.nspname scheme
   FROM pg_namespace
   WHERE pg_namespace.nspname not in ('information_schema'::name,'pg_catalog'::name)
), taboid AS (
 SELECT pg_class.oid
   FROM pg_class
  WHERE (pg_class.relnamespace IN ( SELECT schema_filter.oid
           FROM schema_filter)) AND (lower(pg_class.relkind) = ANY (relKindFilter))
), child_parent(par, cld) AS (
 SELECT pg_inherits.inhparent,
    pg_inherits.inhrelid
   FROM pg_inherits
  WHERE (pg_inherits.inhparent IN ( SELECT taboid.oid
           FROM taboid))
UNION ALL
 SELECT parent.par,
    child.inhrelid
   FROM child_parent parent,
    pg_inherits child
  WHERE parent.cld = child.inhparent AND (parent.par IN ( SELECT taboid.oid
           FROM taboid))
), roots_only AS (
 SELECT child_parent.par AS rootid,
    child_parent.cld AS relid
   FROM child_parent
  WHERE NOT (child_parent.par IN ( SELECT child_parent_1.cld
           FROM child_parent child_parent_1))
), cls AS (
 SELECT schema_filter.scheme,pg_class.oid,
    pg_class.relname,
    pg_class.reltuples,
    pg_total_relation_size(pg_class.reltoastrelid::regclass) AS toast_bytes
   FROM pg_class inner join schema_filter
     ON pg_class.relnamespace = schema_filter.oid
  WHERE lower(pg_class.relkind) = ANY (relKindFilter)
), tab AS (
 SELECT cls.oid AS parent,
    cls.oid,
    cls.scheme,
    cls.relname,
    cls.reltuples,
    pg_total_relation_size(cls.oid::regclass) AS total_bytes,
    pg_table_size(cls.oid::regclass) AS object_bytes,
    pg_indexes_size(cls.oid::regclass) AS index_bytes,
    cls.toast_bytes,
    true AS is_root
   FROM cls
  WHERE NOT (cls.oid IN ( SELECT roots_only.relid
           FROM roots_only))
UNION ALL
 SELECT r.rootid AS parent,
    cls.oid,
    NULL::name AS scheme,
    NULL::name AS relname,
    cls.reltuples,
    pg_total_relation_size(cls.oid::regclass) AS total_bytes,
    pg_table_size(cls.oid::regclass) AS object_bytes,
    pg_indexes_size(cls.oid::regclass) AS index_bytes,
    cls.toast_bytes,
    false AS is_root
   FROM cls
     JOIN roots_only r ON cls.oid = r.relid
), byt AS (
 SELECT tab.parent,
    min(tab.scheme::text) AS scheme,
    min(tab.relname::text) AS object_name,
    sum(tab.reltuples) AS row_estimate,
    sum(tab.total_bytes) AS total_bytes,
    sum(tab.object_bytes) AS object_bytes,
    sum(tab.index_bytes) AS index_bytes,
    sum(tab.toast_bytes) AS toast_bytes
   FROM tab
  GROUP BY tab.parent
)
 SELECT byt.scheme,
    byt.object_name,
    byt.row_estimate,
    byt.total_bytes,
    pg_size_pretty(byt.total_bytes) AS total_size,
    byt.object_bytes,
    pg_size_pretty(byt.object_bytes) AS object_size,
    byt.index_bytes,
    pg_size_pretty(byt.index_bytes) AS index_size,
    byt.toast_bytes,
    pg_size_pretty(byt.toast_bytes) AS toast_size
   FROM byt;
$function$
;

CREATE VIEW index_size AS
SELECT scheme, object_name AS index_name,
  row_estimate,
  total_bytes,
  total_size
FROM object_size('{i}'::character(1)[]) object_size(scheme, object_name, row_estimate, total_bytes, total_size, object_bytes, object_size, index_bytes, index_size, toast_bytes, toast_size)
;

CREATE VIEW table_size AS
SELECT scheme, object_name AS table_name,
 row_estimate,
 total_bytes,
 total_size,
 object_bytes AS table_bytes,
 object_size AS table_size,
 index_bytes,
 index_size,
 toast_bytes,
 toast_size
FROM object_size('{r,p}'::character(1)[]) object_size(scheme, object_name, row_estimate, total_bytes, total_size, object_bytes, object_size, index_bytes, index_size, toast_bytes, toast_size)
;

CREATE OR REPLACE FUNCTION get_data_object
(tabSchema name, tabName name, pkName name = null, pkCols text[] = '{}', minSchema text[] = '{}', connectionId text = '<connectionId>')
  RETURNS text
  LANGUAGE plpgsql
  IMMUTABLE
AS $function$
  DECLARE
      schemeMin constant text = case cardinality(minSchema)
                                when 0 then ''
                                else chr(13)||'  schemaMin = "'||array_to_string (minSchema,', ')||'"'
                                end ;
  BEGIN
    return tabSchema||'_'||tabname||' {
  type = JdbcTableDataObject
  connectionId = '||connectionId||'
  table {
    name = '||tabSchema||'.'||tabname||'
    primaryKey = ['||array_to_string(pkCols,',')||']
  }'||schemeMin||'
}' ;
  END;
$function$
;

--create view data_objects as
CREATE OR REPLACE FUNCTION get_data_objects(schemaName name)
  RETURNS TABLE (table_schema name, table_name name, min_schema text[], pk_cols text[], data_object text)
  LANGUAGE sql
AS $function$
with pk as
(select table_schema, table_name, constraint_name
 from   information_schema.table_constraints
 where  constraint_type = 'PRIMARY KEY'
   and  table_schema = schemaName
)
,allCols as
(select col.table_schema, col.table_name, concol.column_name pk_col
       ,min(case when concol.column_name is null then null else col.ordinal_position end) over
          (PARTITION BY col.table_schema, col.table_name, concol.column_name) pk_pos
       ,col.ordinal_position, col.column_name, col.data_type
 from   information_schema.columns col
 left join pk
        on col.table_schema = pk.table_schema
       and col.table_name = pk.table_name
 left join information_schema.constraint_column_usage concol
        on col.table_schema = concol.table_schema
       and col.table_name = concol.table_name
       and col.column_name = concol.column_name
       and pk.constraint_name = concol.constraint_name
 where col.table_schema = schemaName
)
select table_schema, table_name
      ,array_agg(column_name||' '||data_type order by ordinal_position) min_schema
      ,array_remove(array_agg(pk_col order by pk_pos),null) pk_cols
      ,get_data_object(tabSchema=>table_schema,
                       tabName=>table_name,
                       pkCols=>array_remove(array_agg(pk_col order by pk_pos),null),
                       minSchema=>array_agg(column_name||' '||data_type order by ordinal_position)
                      ) data_object
from   allCols
group by table_schema, table_name
$function$
;

grant select on index_size to sdlb ;
grant select on table_size to sdlb ;
