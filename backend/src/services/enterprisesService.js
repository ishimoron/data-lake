const pool = require('../config/dbConfig')

class EnterprisesService {
	async addUsers(userHashes, taxId, permissions, name, address) {
		let client
		try {
			client = await pool.connect()
			await client.query('BEGIN')
			const newUserRecord = {
				userHashes,
				taxId,
				permissions,
				name,
				address,
			}
			console.log('newUserRecord', newUserRecord)

			await client.query(
				'INSERT INTO Enterprises (Name, TaxID, Address, Permissions, UserHash) VALUES ($1, $2, $3, $4, $5)',
				[
					newUserRecord.name,
					newUserRecord.taxId,
					newUserRecord.address,
					newUserRecord.permissions.join(' '),
					newUserRecord.userHashes.join(' '),
				]
			)

			await client.query('COMMIT')
			return { success: true, message: 'Users successfully added' }
		} catch (error) {
			await client.query('ROLLBACK')
			return { success: false, message: 'Failed to add users' }
		} finally {
			if (client) {
				client.release()
			}
		}
	}

	async getUsers() {
		let client
		try {
			client = await pool.connect()
			const result = await client.query('SELECT * FROM ENTERPRISES')
			if (result) {
				return { success: true, data: result.rows }
			}
		} catch (error) {
			await client.query('ROLLBACK')
			return { success: false, message: 'Failed to get users' }
		} finally {
			if (client) {
				client.release()
			}
		}
	}
}

module.exports = new EnterprisesService()
