const bcrypt = require('bcryptjs');
var hashedPassword;

const hashpassword = (password) => {
    bcrypt.genSalt(10, function (err, Salt) {
        bcrypt.hash(password, Salt, function (err, hash) {
            if (err) {
                console.log('Cannot encrypt');
                return null
            }
            hashedPassword = hash;
            console.log(hash);
        })
    })
    return hashedPassword
}

module.exports = hashpassword

