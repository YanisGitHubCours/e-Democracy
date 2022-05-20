const db = require('../Database/database.js')
const checkExist = require('../Helper/auth.js')
const bcrypt = require('bcryptjs');
var hashedPassword;
/**
 * Ajoute un utilisateur
 * @returns bool
 */
const registration = (login, mail, name, lastname, phone, password) => {
    if (login == "" || mail == "" || name == "" || lastname == "" || phone == "" | password == "") {
        return false
    }
    else if (checkExist(mail)) {
        return false
    } else {
        bcrypt.genSalt(10, function (err, Salt) {
            bcrypt.hash(password, Salt, function (err, hash) {
                if (err) {
                    console.log('Cannot encrypt');
                    return null
                }
                hashedPassword = hash;
                const query = `INSERT INTO Users (login, mail, name, lastname, phone, password) VALUES (?, ?, ?, ?, ?, ?);`;
                db.query(query,
                    [login, mail, name, lastname, phone, hashedPassword],
                    (err, rows) => {
                        if (err) throw err
                        return true

                    });
            })
        })

    }
}

module.exports = registration