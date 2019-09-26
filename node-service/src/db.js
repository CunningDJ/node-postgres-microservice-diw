'use strict';

const fs = require('fs');
const path = require('path');

const { Pool } = require('pg');
const { db }  = require('./config.json');

// Getting password from db-pass.txt file
// This file should be gitignored and chmod chmod protected
const DB_PASS_FILEPATH = path.resolve(path.join(__dirname, './db-pass.txt'));
const PG_PASSWORD = fs.readFileSync(DB_PASS_FILEPATH, 'utf8').trim();


// Creating a thread pool for querying the database with
const DB_POOL = new Pool({
  host: db.host,
  user: db.user,
  database: db.database,
  password: PG_PASSWORD,
  // max number of clients in the pool
  max: 20,
});


// Query: Get data for all articles
const GET_ALL_ARTICLES_QUERY = `
  SELECT
    author_id as "authorId",
    title,
    description,
    content,
    created_at as "createdAt"
  FROM article
`;
function getAllArticles(callback) {
  DB_POOL.query(GET_ALL_ARTICLES_QUERY, (err, result) => {
    if (err) {
      return callback(err, null);
    }
    return callback(null, result.rows);
  });
}


// Query: Get article data by article ID
const GET_ARTICLE_BY_ID_QUERY = `
  SELECT
    author_id as "authorId",
    title,
    description,
    content,
    created_at as "createdAt"
  FROM article
  WHERE id = $1::uuid
`;
function getArticleById(articleId, callback) {
  DB_POOL.query(GET_ARTICLE_BY_ID_QUERY, [articleId], (err, result) => {
    if (err) {
      return callback(err, null);
    }
    return callback(null, result.rows);
  });
}


// Query: Get user data by username
const GET_USER_BY_USERNAME_QUERY = `
  SELECT
    id,
    display_name as "displayName",
    dob
  FROM user_profile
  WHERE username = $1::text
`;
function getUserByUsername(username, callback) {
  DB_POOL.query(GET_USER_BY_USERNAME_QUERY, [username], function(err, result) {
    if (err) {
      return callback(err, null);
    }
    return callback(null, result.rows);
  });
}


// Query: Get data on all articles for a given username
const GET_ARTICLES_BY_USERNAME_QUERY = `
  SELECT
    a.author_id as "authorId",
    a.title as title,
    a.description as description,
    a.content as content,
    a.create_at as "createdAt"
  FROM article a
  INNER JOIN user_profile u
    ON (a.author_id = u.id)
  WHERE (u.username = $1::text)
`;

function getArticlesByUsername(username, callback) {
  DB_POOL.query(GET_ARTICLES_BY_USERNAME_QUERY, [username], function(err, result) {
    if (err) {
      return callback(err, null);
    }
    return callback(null, result.rows);
  });
}


module.exports = {
  getAllArticles,
  getArticleById,
  getUserByUsername,
  getArticlesByUsername
}
