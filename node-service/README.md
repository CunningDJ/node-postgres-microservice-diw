# Node-Postgres Microservice: NodeJS Service Portion
This is the NodeJS service portion of the node-postgres microservice.  It
connects into the database and tables set up in the [database](../db/) portion of
the project.  Make sure to run the [./main/init_dbs.sh](../db/main/init_dbs.sh)
script in the database portion before running the Node service.

## Steps
1. Run `npm start`

## Key Notes
This is a good starting point for making a node microservice.  As the service grows in size and complexity, the database hooks code (`src/db.js`) might be broken out into multiple files, e.g. `src/db/article.js` and `src/db/userProfile.js`), and similiarly as the routes and number and complexity of endpoints grow, the `src/routes.js` code might also be broken into multiple files, e.g. `src/routes/article.js` and `src/routes/user.js`.

To improve on client security and privacy, you will likely add HTTPS, either betweem this service and the clients (with Apache or Nginx), or in the service itself with node's LetsEncrypt.

Further, you might add client authentication/usage keys to the request to track who and how much are hitting the service, and control who can use the service and how much.
