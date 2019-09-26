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
router.use('/article', articleRouter);
// ... and similarly the /user/.. subpaths with userRouter
router.use('/user', userRouter);


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
 * Article data routes
 */
articleRouter.get('/all', function(req, res, next) {
  // TODO: getAllArticles
  // Querying the database
  db.getAllArticles((err, data) => {
    err = logErrorAndReturnGeneric(err);
    // Sending the JSON with data and/or error message back to the client
    return res.json({ err, data });
  });
})


articleRouter.get('/id/:articleId', function(req, res, next) {
  const { articleId } = req.params;
  // TODO: getArticleById
  // Querying the database
  db.getArticleById(articleId, (err, data) => {
    err = logErrorAndReturnGeneric(err);
    // Sending the JSON with data and/or error message back to the client
    return res.json({ err, data });
  });
})


articleRouter.get('/username/:username', function(req, res, next) {
  const { username } = req.params
  // TODO: getArticlesByUsername
  // Querying the database
  db.getArticlesByUsername(username, (err, data) => {
    err = logErrorAndReturnGeneric(err);
    // Sending the JSON with data and/or error message back to the client
    return res.json({ err, data });
  });
})



/*
 * User data routes
 */
userRouter.get('/username/:username', function(req, res, next) {
  const { username } = req.params;
  // TODO: getUserByUsername
  // Querying the database
  db.getUserByUsername(username, (err, data) => {
    err = logErrorAndReturnGeneric(err);
    // Sending the JSON with data and/or error message back to the client
    return res.json({ err, data });
  });
})


// exporting the router with all the routes contained, for use by the
//   master Express app
module.exports = router;
