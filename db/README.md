# Node-Postgres Microservice: Database Portion
This is the part of the node postgres microservice where the table schema for the
database are defined, as well as all of the automation scripts for
initializing the database, tables, and relevant extensions.

## Structure
There are three directories:
* `schema`, where the schema of the tables (`*.sql`) and the ordering of the
  tables' creation (`table_create_order.txt`) are defined.
* `main`, where the scripts that are run directly are held.  This consists of
  `init_dbs.sh`, which sets up everything, and `create_extensions.sql`, which
  is called in that setup process, but also could be run by itself if more
  extensions need to be established.
* `lib`, which contains supporting scripts for `init_dbs.sh` which could also
  be used to supplement other `main` scripts as needed.
