# datamig-template
## Sample PostGre DB

This folder contains SQL scripts to create two small PostGres schemata `datamig_src` and `datamig_tgt`
which contain the needed data objects for this data migration template.

The following commands assume that you wish to create the source and target schemata in a database called `sdlb`
which the user `sdlb` possesses the necessary privileges to create tables and other data objects.
You may change the name of the database and the user by modifying the scripts and commands commands below.
For this end you are reffered to the official Postgres documentation
on how to create databases and users and how to grant privileges:
https://www.postgresql.org/docs/current/tutorial-createdb.html

```
psql --dbname=postgres --username=postgres --command="create database sdlb"
psql --dbname=sdlb --username=postgres --command="create user sdlb with password 'sdlb'; grant create on database sdlb to sdlb ;"
psql --dbname=sdlb --username=sdlb --file=pg_datamig_src.sql
psql --dbname=sdlb --username=sdlb --file=pg_datamig_tgt.sql
psql --dbname=sdlb --username=postgres --command="vacuum analyze"
```
### Additional Gadgets
The script `postgreAdditional.sql` contains statements to create function and views in schema `public` to monitor the size of database objects
and a function to generate data objects for the Smart Datalake Builder which we will follow up soon.
```
psql --dbname=sdlb --username=postgres --file=pg_additional.sql
```
