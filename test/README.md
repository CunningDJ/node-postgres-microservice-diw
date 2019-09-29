# Node-Postgres Microservice: Testing
This folder contains a simple executable integration test script (`run_integration_tests.sh`) for hitting the service endpoints based on the data seeded with the scripts in [mock-seed/](../mock-seed/) and the server being run from [node-service/](../node-service/).

## Steps
0. Seed the data by running the executable script in `mock-seed/` if you
   haven't already.
1. Run the node service in a terminal window by:
  a. `cd` to `node-service/`
  b. `npm start`
2. Open a second terminal window, go to this folder (`test/`), and run the
   integration tests via: `./run_integration_tests.sh`
3. If the data is seeded and the node service is running, you should see data
   come back for each endpoint hit.
