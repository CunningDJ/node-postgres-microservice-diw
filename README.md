# Node-Postgres Microservice
This is a basic setup for a Node + PostgreSQL microservice.  It can be used
instructionally, as a Hello World for creating such a service, or as
a boilerplate starting point.

A full explanation of this project can be found at [this Dabbling In Web
article](https://web.dabblingin.com/p/microservice-nodejs-postgresql).
You can also find a more summary of each portion (`db/`,
`node-service/`, `mock-seed/` and `test/`) in the READMEs of their respective folders.

The [db/](db/) folder contains the setup scripts and schema for the postgres database, tables and
extensions.

The [node-service/](node-service/) folder contains the code for the node service that plugs
into the data of this database.

The [mock-seed/](mock-seed/) folder contains scripts for seeding mock data into the databases that were established by the scripts and schema in [db/](db/).

And finally, the [test/](test/) folder contains integration test scripts for hitting the running node service endpoints and showing what each return/fail.
