const db = require('../Database/database.js')

const CheckUser = (mail) => {
    if (mail == "") {
        return true
    } else {
        var sql = 'SELECT id FROM Users WHERE mail = ?';
        db.query(sql, [mail], function (err, result) {
            if (result) {
                return true
            } else {
                return false
            }
        });
    }
}

module.exports = CheckUser