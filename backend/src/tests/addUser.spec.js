const request = require('supertest')
const app = require('../index')

describe('POST /enterprise/users/add', () => {
	test('It should respond with 400 if required parameters are missing', async () => {
		const response = await request(app).post('/enterprise/users/add').send({})
		expect(response.statusCode).toBe(400)
	})

	test('It should respond with 200 if users are added successfully', async () => {
		const response = await request(app)
			.post('/enterprise/users/add')
			.send({
				taxId: '7162828483',
				userHashes: ['hash1', 'hash2'],
				permissions: ['perm1', 'perm2'],
			})
		expect(response.statusCode).toBe(200)
	})
})
