/* eslint-disable linebreak-style */
/* eslint-disable object-curly-spacing */
/* eslint-disable comma-dangle */
/* eslint-disable eol-last */
/* eslint-disable quotes */
const Sequelize = require("sequelize");
const db = require("../config/db");

const User = db.define(
  // eslint-disable-next-line quotes
  "user",
  {
    username: { type: Sequelize.STRING},
    // eslint-disable-next-line object-curly-spacing
    email: { type: Sequelize.STRING},
    password: { type: Sequelize.STRING },
    address: { type: Sequelize.STRING},
    phone_number: { type: Sequelize.STRING},
  },
  {
    freezeTableName: true
  }
);
// eslint-disable-next-line linebreak-style
// eslint-disable-next-line linebreak-style
// eslint-disable-next-line linebreak-style

module.exports = User;