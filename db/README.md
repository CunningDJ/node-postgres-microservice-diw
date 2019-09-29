# Node-Postgres Microservice: Database Portion
This is the part of the node postgres microservice where the table schema for the
database are defined, as well as all of the automation scripts for
initializing the database, tables, and relevant extensions.  The full
discussion of this project can be found at [this Dabbling In Web
article](https://web.dabblingin.com/p/microservice-nodejs-postgresql).

## Steps
1. Run `./main/init_dbs.sh`

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

## Key Notes
This structure can be useful for setting up and automating the setup of
postgres on any project.
The only files that need to be changed are:

* Changing the database name to whatever you want in the `main/db_name.txt` file.
* Whatever table `.sql` schema you want in `schema/`, and adding the files in appropriate order (based on foreign key dependencies) to `schema/create_table_order.txt`.
* Adding the above tables as they're added to `lib/drop_tables.sql` to ensure
  that they're cleaned out if/when you want to, or to control which if any are
  acutally dropped when drop is chosen in the `init_dbs.sh` process.
