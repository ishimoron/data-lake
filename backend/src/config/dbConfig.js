const { Pool } = require('pg')

const pool = new Pool({
	user: 'postgres',
	host: 'localhost',
	database: 'data-lake',
	password: '1q2w3e4rA',
	port: 5432,
})

module.exports = pool
