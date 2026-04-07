# datamig-template
## Sample PostGre DB

This folder contains SQL scripts to create two small PostGres schemata `datamig_src` and `datamig_tgt`
which contain the needed data objects for this data migration template.

### Prerequisites

1) A Postgres DB named `sdlb` where the two schemata will be created
2) A Postgres User named `sdlb`
   who will own the data objects and who will run the SDLB

You may change the name of the DB and the SDLB user by modifying the script `postgreSetup.sql`.

### Grant create to DB user
Run as superuser, e.g. as `postgres`, the schript `postgreSetup.sql`:
```
psql --echo-queries --dbname=sdlb --username=postgres --file=postgreSetup.sql
```

### Create the source and target schemata
Run as SDLB user, e.g. as `sdlb`, the schema creation schripts:
```
psql --dbname=sdlb --username=sdlb --file=datamig_src.sql
psql --dbname=sdlb --username=sdlb --file=datamig_tgt.sql
```
