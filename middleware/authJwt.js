/* eslint-disable linebreak-style */
/* eslint-disable quotes */
/* eslint-disable no-unused-vars */
/* eslint-disable semi */
/* eslint-disable consistent-return */
/* eslint-disable indent */
/* eslint-disable prefer-destructuring */
/* eslint-disable prefer-const */
/* eslint-disable dot-notation */
/* eslint-disable comma-dangle */
/* eslint-disable eol-last */
require('dotenv').config();
const jwt = require("jsonwebtoken");

const verifyToken = async (req, res, next) => {
    let authorization = req.headers["authorization"]
    let token = authorization.split(' ')[1]

    if (!token) {
        return res.status(403).send({
            message: "A token is required for authentication"
        });
    }

    jwt.verify(token, process.env.JWT_SECRET_KEY, (err, decoded) => {
        if (err) {
            return res.status(401).send({
                message: "Invalid Token"
            });
        }

        req.user_id = decoded.user_id;

        next();
    });
}

module.exports = {
    verifyToken
}