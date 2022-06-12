/* eslint-disable no-console */
const express = require('express');

const app = express();
const db = require('./config/db');
const Router = require('./routes');

app.use(express.urlencoded({ extended: true }));
db.authenticate().then(() => console.log('berhasil terkoneksi dengan database'));

app.use('/api', Router);
app.get('/', (req, res) => res.send('respon nodejs berhasil'));

app.listen(process.env.PORT, () => console.log('Runing server on port ${process.env.PORT'));
