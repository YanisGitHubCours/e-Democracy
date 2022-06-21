const express = require('express')
const pool = require('../Database/db.js')
const bcrypt = require('bcryptjs')
const register = require('../Controller/register.js')
const login = require('../Controller/login.js')
const jwt = require("jsonwebtoken");
const router = express.Router()

router.post('/register', async (req, res) => {
    var result = ""
    var status = "error"
    const { username, mail, phone, name, lastname, password: plainTextPassword } = req.body

    if (!username || typeof username !== 'string') {
        return res.json({ status: status, error: 'Invalid username' })
    }
    if (!mail.includes('@')) {
        return res.json({ status: status, error: 'Invalid mail' })
    }


    if (!plainTextPassword || typeof plainTextPassword !== 'string') {
        return res.json({ status: status, error: 'Invalid password' })
    }

    if (plainTextPassword.length < 5) {
        return res.json({
            status: status,
            error: 'Password too small'
        })
    }

    const password = await bcrypt.hash(plainTextPassword, 10)

    try {
        //select bdd
        const sqlOne = `SELECT login FROM Users WHERE mail = '${mail}'`
        console.log(sqlOne)
        pool.query(sqlOne, async (err, data) => {
            if (data.length == 0) {
                register(username, mail, phone, name, lastname, password)
                status = "good"
                result = "welcome"
            } else {
                result = "User already exist"
            }

        });
    } catch (error) {
        return res.json({ status: status, error: 'error with register' })
    }

    res.json({ status: status, error: result })
})

router.post('/login', async (req, res) => {
    var result = ""
    var status = "error"
    const { mail, password } = req.body


    if (!mail.includes('@')) {
        return res.json({ status: status, error: 'Invalid mail' })
    }

    try {
        //select bdd
        const sqlOne = `SELECT password FROM Users WHERE mail = '${mail}'`
        pool.query(sqlOne, async (err, data) => {

            if (data.length != 0) {
                const pass = await bcrypt.compare(password, data[0].password)
                console.log(pass)
                /*const token = jwt.sign(mail, "secret");
                login(token)
                return res.json({
                    login: true,
                    token: token,
                    data: mail,
                });*/
            } else {
                result = "check your mail and password"
            }

        });
    } catch (error) {
        return res.json({ status: status, error: 'error with register' })
    }

    return res.json({ status: status, error: result })
})

module.exports = router;