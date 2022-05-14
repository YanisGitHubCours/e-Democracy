const mysql = require('mysql')
const dotenv = require('dotenv')
dotenv.config()

const myport = process.env.DBPORT
const mypassword = process.env.PASSWORD
const myhost = process.env.HOST
const myuser = process.env.USER


var connection = mysql.createConnection({
    host: myhost,
    user: myuser,
    password: mypassword
});

connection.connect(function (err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }

    console.log('connected as id ' + connection.threadId);
});