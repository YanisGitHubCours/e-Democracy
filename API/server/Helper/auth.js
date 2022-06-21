const db = require('../Database/database.js')

const CheckUser = async (mail) => {
    var sql = 'SELECT id FROM Users WHERE mail = ?';
    db.query(sql, [mail], function (err, result) {
        if (err) throw err;
        if (result.lenght > 0) {
            return false
        } else {
            return true
        }
    })
}

module.exports = CheckUser