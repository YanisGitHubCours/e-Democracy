const express = require('express')
const bodyParser = require('body-parser')
const dotenv = require('dotenv')
const morgan = require('morgan')
const routerA = require('./Route/auth.js')
const mysql = require('mysql')

dotenv.config()
const port = process.env.PORT
const myport = process.env.DBPORT
const mypassword = process.env.PASSWORD
const myhost = process.env.HOST
const mydbname = process.env.DBNAME
const app = express()


app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use(morgan('tiny'))
app.use(routerA)
app.listen(port, () => {
    console.log(`server listen at ${port}`)
})