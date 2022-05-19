const db = require('../Database/database.js')
const hash = require('../Hash/hash.js')
/**
 * Ajoute un utilisateur
 * @returns bool
 */
const registration = (login, mail, name, lastname, phone, password) => {
    if (login == "" || mail == "" || name == "" || lastname == "" || phone == "" | password == "") {
        return false
    }
    console.log(password)
    var hpassword = hash(password)
    console.log(hpassword)

    const query = `INSERT INTO Users (login, mail, name, lastname, phone, password) VALUES (?, ?, ?, ?, ?, ?);`;
    db.query(query,
        [login, mail, name, lastname, phone, hpassword],
        (err, rows) => {
            if (err) throw err;
            console.log("Row inserted with id = " + rows.insertId);
            return false;
        });
    return true
}

module.exports = registration