const pool = require('../Database/db.js')

const registration = (username, mail, phone, name, lastname, password) => {
    const sql = `INSERT INTO Users (login,mail,phone,name,lastname,password) VALUES ('${username}','${mail}','${phone}','${name}','${lastname}','${password}')`
    console.log(sql)
    pool.query(sql, (err, data) => {
        if (err)
            throw err;
        console.log('User created successfully: ')
    });
}

module.exports = registration