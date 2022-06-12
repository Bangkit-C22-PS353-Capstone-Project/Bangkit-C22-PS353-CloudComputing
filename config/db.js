/* eslint-disable linebreak-style */
const sequelize = require('sequelize');

// eslint-disable-next-line new-cap
const db = new sequelize('db_bumitani', 'root', 'Apalah1807', {
  dialect: 'mysql',
  host: '', 
});

db.sync({});

module.exports = db;
