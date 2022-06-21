
const mysql = require('mysql')
const dotenv = require('dotenv')
dotenv.config()

const myport = process.env.DBPORT
const mypassword = process.env.PASSWORD
const myhost = process.env.HOST
const mydbname = process.env.DBNAME



const Pool = mysql.createPool({
    connectionLimit: 100,
    host: myhost,
    user: 'root',
    port: myport,
    password: mypassword,
    database: mydbname
});

Pool.getConnection((err, connection) => {
    if (err)
        throw err;
    console.log('Database connected successfully');
    connection.release();
});



module.exports = Pool