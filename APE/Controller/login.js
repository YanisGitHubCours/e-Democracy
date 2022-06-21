const pool = require('../Database/db.js')

const login = (token) => {
    const sql = `INSERT INTO Users (token) VALUES ('${token}')`
    console.log(sql)
    pool.query(sql, (err, data) => {
        if (err)
            throw err;
        console.log('login success')
    });
}

module.exports = login