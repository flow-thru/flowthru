
const express = require('express');
const pg = require('pg');
const app = express();
require('dotenv').config()

const config = {
    user: process.env.POSTGRES_USER,
    database: process.env.POSTGRES_DB,
    password: process.env.POSTGRES_PASSWORD,
    port: process.env.POSTGRES_PORT
};

const POOL = new pg.Pool(config);
const PATH = __dirname + '/client/'
const PORT = process.env.NODE_PORT || 3000

app.use('/', (req, res, next) => {
    console.log('/' + req.method);
    next();
})

app.get('/', (req, res) => {
    res.sendFile(PATH + 'index.html');
});

app.use(express.static(PATH));

app.listen(PORT, () => {
    console.log('Server running on port ' + PORT);
});