#!/usr/bin/env  node
'use strict';

/*
 * The main script for running the server microservice.
 */

const http = require('http');

const express = require('express');
const pg = require('pg');

// project configuration
const config = require('./config.json');

// REST API routes
const routes = require('./routes');

// initializing ExpressKS middleware app
const app = express();

// Installing middleware routes into the Express app
app.use(routes);

// Initializing HTTP server instances with ExpressJS app
const httpServer = http.createServer(app);

// Starting HTTP server
httpServer.listen(config.httpPort, (err) => {
  if (err) {
    return console.error("SERVER ERROR:", error);
  }
  return console.log(`Node Microservice running successfully on port ${config.httpPort}!`);
});
