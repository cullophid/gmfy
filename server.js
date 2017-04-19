//@flow weak
const express = require('express')
const proxy = require('express-http-proxy')
const path = require('path')
const app = express()
const API_SERVER = process.env.API_SERVER || 'localhost:8080'
const  PORT= process.env.PORT || 3000

app.use(express.static('public'))
app.use('/api', proxy(API_SERVER))
app.get('/*', (req, res) => res.sendFile(path.join(__dirname, 'public/index.html')))

app.listen(PORT, () => console.log(`server listening on port ${PORT}`))
