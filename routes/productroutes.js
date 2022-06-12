/* eslint-disable linebreak-style */
/* eslint-disable quotes */
/* eslint-disable linebreak-style */
/* eslint-disable semi */
/* eslint-disable no-multiple-empty-lines */
/* eslint-disable eol-last */
const express = require("express")
// eslint-disable-next-line semi
const router = express.Router()
// eslint-disable-next-line semi
const getProduct = require("../controllers/productcontroller")


router.get("/:id_product", getProduct);
// eslint-disable-next-line linebreak-style

module.exports = router;