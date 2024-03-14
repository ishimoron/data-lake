const express = require('express')
const app = express()
const pool = require('./config/dbConfig')
const client = pool.connect()
const routes = require('./routes/route')
const cors = require('cors')

const corsOption = {
	origin: ['http://localhost:3000'],
}

app.use(cors(corsOption))
app.use(express.json())
app.use(routes)

const PORT = process.env.PORT || 4000
app.listen(PORT, () => {
	console.log(`Server is running on port: ${PORT}`)
})

module.exports = app
