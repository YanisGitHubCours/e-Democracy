const express = require('express');
const auth = require('../controller/user/auth.js')
const userSwift = require('../controller/swift/user.js')
const isAuthorized = require("../Helper/authotoken")
const router = express.Router()

router.post('/uLogin', async (req, res) => {
    await auth.login(req.body,res)
})

router.post('/signUp', async (req, res) => {
    await auth.ParseInput(req.body,res)

})

router.post('/uLogout', isAuthorized, async(req, res) => {
    await auth.logout(req,res)
})

router.patch('/updateprofile', isAuthorized, async(req,res) => {
    await userSwift.updateprofile(req.body, res)
})




module.exports = router