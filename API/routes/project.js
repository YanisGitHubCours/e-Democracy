const express = require('express');
const project = require("../controller/project/auth")
const isAuthorized = require("../Helper/authotoken")
const task = require("../controller/project/task")
const router = express.Router()

router.post('/pLogin', async (req, res) => {
    await project.login(req.body,res)
})

router.post('/pLogout', isAuthorized, async(req, res) => {
    await project.logout(req,res)
})

router.post('/addtask', isAuthorized, async(req,res) => {
    await task.addtask(req.body,res)
})

router.patch('/updatetask', isAuthorized, async(req,res) => {
    await task.updatetask(req.body, res)
})

router.delete('/deletetask', isAuthorized, async(req,res) =>{
    await task.deletetask(req.body, res)
})




module.exports = router