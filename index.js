
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

const pool = new pg.Pool(config);

app.get('/', (req, res) => {
    res.send('<h1>Flow</h1>');
});

const PORT = process.env.NODE_CONTAINER_PORT || 3000
app.listen(PORT, () => console.log('Server running on port ' + PORT));