with pk as
(select table_schema, table_name, constraint_name
 from   information_schema.table_constraints
 where  constraint_type = 'PRIMARY KEY'
   and  table_schema = :'SCHEMA_NAME'
)
,allCols as
(select col.table_schema, col.table_name, concol.column_name pk_col
       ,min(case when concol.column_name is null then null else col.ordinal_position end) over
          (PARTITION BY col.table_schema, col.table_name, concol.column_name) pk_pos
       ,col.ordinal_position, col.column_name
       ,case when upper(col.data_type) like '%CHAR%' then 'STRING'
             when upper(col.data_type) like '%TEXT%' then 'STRING'
             else upper(col.data_type)
        end data_type
 from   information_schema.columns col
 left join pk
        on col.table_schema = pk.table_schema
       and col.table_name = pk.table_name
 left join information_schema.constraint_column_usage concol
        on col.table_schema = concol.table_schema
       and col.table_name = concol.table_name
       and col.column_name = concol.column_name
       and pk.constraint_name = concol.constraint_name
 where col.table_schema = :'SCHEMA_NAME'
),arr as
(select table_schema, table_name
       ,array_remove(array_agg(pk_col order by pk_pos),null) pkCols
       ,array_agg(column_name||' '||data_type order by ordinal_position) min_schema
 from allCols
 group by table_schema, table_name
)
select 'dataObjects {
'||string_agg('  '||table_schema||'_'||table_name||' {
    type = JdbcTableDataObject
    connectionId = '||:'CONNECTION_ID'||'
    table {
      name = '||table_schema||'.'||table_name||'
      primaryKey = ['||array_to_string(pkCols,',')||']
    }'||case cardinality(min_schema)
        when 0 then ''
        else chr(10)||'  schemaMin = "'||array_to_string (min_schema,', ')||'"'
        end||'
  }', chr(10))||'
}'
from   arr
;