const env = require('dotenv')
const mysql = require('mysql');

const pool = mysql.createPool ({
    host: 'localhost',
    user: 'api',
    password: 'Xx490050.0',
    database: 'reto2',
    listPerPage: 10,
});

module.exports = pool;