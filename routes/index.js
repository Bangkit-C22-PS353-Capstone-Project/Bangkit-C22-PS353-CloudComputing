/* eslint-disable linebreak-style */
/* eslint-disable eol-last */
const express = require('express');

const router = express.Router();
const authJwt = require('../middleware/authJwt');
// eslint-disable-next-line no-unused-vars

const Auth = require('./authroutes');
const Product = require('./productroutes');

router.use('/auth', Auth);
router.use('/product', [authJwt.verifyToken], Product);

module.exports = router;