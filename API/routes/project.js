const express = require('express');
const project = require("../controller/project/auth")
const isAuthorized = require("../Helper/authotoken")
const router = express.Router()

router.post('/pLogin', async (req, res) => {
    await project.login(req.body,res)
})

router.post('/pLogout', isAuthorized, async(req, res) => {
    await project.logout(req,res)
})

router.post('/addtask', isAuthorized, async(req,res) => {
    console.log("add task")
})

router.patch('/updatetask', isAuthorized, async(req,res) => {
    console.log("update task")
})

router.delete('/deletetask', isAuthorized, async(req,res) =>{
    console.log("delete")
})




module.exports = router