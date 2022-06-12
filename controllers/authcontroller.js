// eslint-disable-next-line linebreak-style
/* eslint-disable camelcase */
/* eslint-disable no-unused-vars */
/* eslint-disable linebreak-style */
/* eslint-disable object-curly-spacing */
/* eslint-disable no-use-before-define */
/* eslint-disable indent */
/* eslint-disable quotes */
/* eslint-disable space-before-blocks */
require('dotenv').config();
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
// eslint-disable-next-line no-unused-vars
const Users = require("../models/users");

// eslint-disable-next-line consistent-return
const login = async (req, res) => {
    try {
        const { username, password } = req.body;

        const user = await Users.findOne({
            where: {
                username,
            },
        });

        if (!user){
            return res.status(401).json({
                message: "Pengguna belum terdaftar!",
            });
        }

        const passwordIdValid = bcrypt.compareSync(password, user.password);
        if (!passwordIdValid){
            return res.status(401).json({
                message: "Password Salah!",
            });
        }

        const payload = {
            user_id: user.id,
            username: user.username,
            email: user.email,
        };
        const accessToken = `Bearer ${generateAccessToken(payload, process.env.JWT_SECRET_KEY, {expiresIn: '10d'})}`;
        const refreshToken = generateAccessToken(payload, process.env.REFRESH_TOKEN_SECRET);

        return res.status(200).json({
            message: "Anda Berhasil Login!",
            user,
            token: {
                access_token: accessToken,
                refresh_token: refreshToken,
            },
        });
    } catch (err) {
        res.status(500).json({
            message: err.message,
        });
    }
};

const register = async (req, res) => {
    try {
        const {
 username, email, password, address, phone_number,
} = req.body;

        const salt = bcrypt.genSaltSync(10);
        const hash = bcrypt.hashSync(password, salt);

        const user = new Users({
            username, email, password: hash, address, phone_number,
        });

        const userData = await user.save();
        const user_id = userData.id;

        res.status(200).json({
            message: "Anda Berhasil Mendaftar!",
            user,
        });
    } catch (err) {
        res.status(500).json({
            message: err.message,
        });
    }
};

const generateAccessToken = (payload, secretKey, expires) => jwt.sign(payload, secretKey, expires);

module.exports = { login, register };
