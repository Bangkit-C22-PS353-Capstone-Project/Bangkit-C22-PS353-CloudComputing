/* eslint-disable linebreak-style */
// eslint-disable-next-line linebreak-style
/* eslint-disable import/newline-after-import */
/* eslint-disable linebreak-style */
// eslint-disable-next-line linebreak-style
/* eslint-disable quotes */
/* eslint-disable linebreak-style */
/* eslint-disable semi */
/* eslint-disable no-unused-vars */
/* eslint-disable eol-last */
const express = require("express")
const router = express.Router()
const authController = require("../controllers/authcontroller")
const verifiySignUp = require("../middleware/verifySignUp")

router.post("/login", authController.login);
router.post('/register', [verifiySignUp.checkDuplicateUsernameorEmail], authController.register);
module.exports = router;