# datamig-template

## SQL Scripts for Postgres

### [pg_getDataObjects.sql](pg_getDataObjects.sql)

```
psql --tuples-only --no-align --dbname=sdlb --username=sdlb --file=sql/pg_getDataObjects.sql --variable=CONNECTION_ID=conn_source_db --variable=SCHEMA_NAME=datamig_src --output=config/datamig_src.conf
psql --tuples-only --no-align --dbname=sdlb --username=sdlb --file=sql/pg_getDataObjects.sql --variable=CONNECTION_ID=conn_target_db --variable=SCHEMA_NAME=datamig_tgt --output=config/datamig_tgt.conf
psql --tuples-only --no-align --dbname=sdlb --username=sdlb --file=sql/pg_getDataObjects.sql --variable=CONNECTION_ID=conn_target_db --variable=SCHEMA_NAME=datamig_src | sed 's/datamig_src_/error_/;s/datamig_src\./datamig_tgt.error_/;s/"$/, reason STRING"/' > config/error_tables.conf
```
