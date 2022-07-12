const express = require('express');
const adminauth = require('../controller/admin/auth.js')
const adminuser = require('../controller/admin/user.js')
const polls = require('../controller/admin/polls.js')
const isAuthorized = require("../Helper/authotoken")
const adminanswer = require('../controller/admin/answer.js')
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
    await adminuser.deleteUser(req.body.id,res)
})

router.post('/getAnswerByIdPoll', isAuthorized, async(req,res) =>{
    await adminanswer.getAnswerById(req, res)
})






module.exports = router