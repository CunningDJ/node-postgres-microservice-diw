'use strict';

const { Router }  = require('express');
const db = require('./db');

// We will use a generic user-facing error for database query issues
const GENERIC_BACKEND_EXTERNAL_ERROR = "There was a problem with the server.";

// This router will be used to define all the middleware routes
const router = Router();
const articleRouter = Router();
const userRouter = Router();

// We further nest the /article/.. subpaths with the articleRouter object
router.use('/articles', articleRouter);
// ... and similarly the /user/.. subpaths with userRouter
router.use('/users', userRouter);


/*
 * Utilities
 */
function logErrorAndReturnGeneric(err) {
  if (err) {    
    console.error('[getAllArticles route]',err);
    err = GENERIC_BACKEND_EXTERNAL_ERROR;
  }
  return err;
}

/*
 * Article routes
 */
articleRouter.get('/', (req, res, next) => {
  // GET all articles
  const { username } = req.query;
  // Querying the database
  if (username) {
    db.getArticlesByUsername(username, (err, data) => {
      err = logErrorAndReturnGeneric(err);
      // Sending the JSON with data and/or error message back to the client
      return res.json({ err, data });
    });
  } else {
    db.getAllArticles((err, data) => {
      err = logErrorAndReturnGeneric(err);
      // Sending the JSON with data and/or error message back to the client
      return res.json({ err, data });
    });
  }
})


articleRouter.get('/:articleId', (req, res, next) => {
  // GET article data by article ID
  const { articleId } = req.params;
  // Querying the database
  db.getArticleById(articleId, (err, data) => {
    err = logErrorAndReturnGeneric(err);
    // Sending the JSON with data and/or error message back to the client
    return res.json({ err, data });
  });
})


/*
 * User routes
 */
userRouter.get('/:username', (req, res, next) => {
  // GET user data by username
  const { username } = req.params;
  // Querying the database
  db.getUserByUsername(username, (err, data) => {
    err = logErrorAndReturnGeneric(err);
    // Sending the JSON with data and/or error message back to the client
    return res.json({ err, data });
  });
})

userRouter.get('/:username/articles', (req, res, next) => {
  // GET articles by a given author
  const { username } = req.params
  // Querying the database
  db.getArticlesByUsername(username, (err, data) => {
    err = logErrorAndReturnGeneric(err);
    // Sending the JSON with data and/or error message back to the client
    return res.json({ err, data });
  });
});


// exporting the router with all the routes contained, for use by the
//   master Express app
module.exports = router;
