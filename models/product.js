/* eslint-disable linebreak-style */
/* eslint-disable quotes */
/* eslint-disable indent */
/* eslint-disable comma-dangle */
/* eslint-disable eol-last */
const sequelize = require("sequelize");
const db = require("../config/db");

const Products = db.define(
    "products",
    {
        id_product: { type: sequelize.INTEGER, autoIncrement: true, primaryKey: true },
        id_category: { type: sequelize.INTEGER },
        product_name: { type: sequelize.STRING },
        product_description: { type: sequelize.STRING },
        product_price: { type: sequelize.INTEGER },
        product_stock: { type: sequelize.INTEGER },
        product_image: { type: sequelize.STRING },
        product_location: { type: sequelize.STRING },
    },
    {
        freezeTableName: true,
        timestamps: false,
    }
);

module.exports = Products;