/* eslint-disable linebreak-style */
// eslint-disable-next-line linebreak-style
/* eslint-disable quotes */
/* eslint-disable linebreak-style */
/* eslint-disable semi */
/* eslint-disable import/order */
/* eslint-disable indent */
/* eslint-disable prefer-const */
/* eslint-disable no-unused-vars */
/* eslint-disable object-curly-spacing */
/* eslint-disable comma-dangle */
/* eslint-disable object-shorthand */
/* eslint-disable keyword-spacing */
const { Users } = require("../models")
const { Op } = require("sequelize")

const checkDuplicateUsernameorEmail = async (req, res, next) => {
    let { username, email } = req.body

    const isExist = await Users.findOne({
        where: {
            [Op.or]: [{username: username}, {email: email}]
        }
    })

    // eslint-disable-next-line space-before-blocks
    if(isExist){
        res.status(400).send({
            // eslint-disable-next-line quotes
            message: "Error! Email atau username sudah tersedia!"
        });
        return;
    }
    next()
}

module.exports = {
    checkDuplicateUsernameorEmail
// eslint-disable-next-line linebreak-style
// eslint-disable-next-line eol-last
}