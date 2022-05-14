const express = require('express')
const router = require('./Routes/route.js')
const dotenv = require('dotenv')
const bodyparser = require('body-parser')
const morgan = require('morgan')


dotenv.config()
const port = process.env.PORT
const app = express()

app.use(bodyparser.urlencoded({ extended: false }))
app.use(bodyparser.json())
app.use(morgan('tiny'))
app.use(router)

app.listen(port, () => {
    console.log(`server listen at ${port}`)
})