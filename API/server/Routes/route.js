const express = require('express')
const registration = require('../Controller/registration.js')
const router = express.Router()

router.get('/', (req, res) => {
    res.send('home page')
})

router.post('/registration', (req, res) => {
    const { login, mail, name, lastname, phone, password } = req.body
    res.send(registration(login, mail, name, lastname, phone, password))
})



module.exports = router;