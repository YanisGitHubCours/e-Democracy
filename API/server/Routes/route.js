const express = require('express')
const router = express.Router()

router.get('/', (req, res) => {
    res.send('home page')
})

router.post('/registration', (req, res) => {
    console.log(req.body)
    res.send("regi")
})



module.exports = router;