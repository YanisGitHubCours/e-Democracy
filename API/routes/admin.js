const express = require('express');
const adminauth = require('../controller/admin/auth.js')
const polls = require('../controller/admin/polls.js')
const isAuthorized = require("../Helper/authotoken")
const router = express.Router()

router.post('/aLogin', async (req, res) => {
    await adminauth.login(req.body,res)
})

router.post('/aLogout', isAuthorized, async(req, res) => {
    await adminauth.logout(req,res)
})

router.get('/getallpolls', isAuthorized, async(req,res) => {
    await polls.getPolls(res)
})

router.post('/userpolls', isAuthorized, async(req,res) => {
    await polls.getPollsByIdUser(req,res)
})

router.post('/pollsbytimer', isAuthorized, async(req,res) => {
    await polls.getPollsByTimer(req,res)
})

router.post('/pollsbytype', isAuthorized, async(req,res) => {
    await polls.getPollsByType(req,res)
})

router.delete('/deletepoll', isAuthorized, async(req,res) => {
    await polls.deletePolls(req,res)
})

router.delete('/deleteaccount', isAuthorized, async(req,res) => {
    
})






module.exports = router