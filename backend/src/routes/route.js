const express = require('express')
const router = express.Router()
const enterprisesService = require('../services/enterprisesService')

router.post('/enterprise/users/add', async (req, res) => {
	try {
		const { userHashes, taxId, permissions, name, address } = req.body
		if (!userHashes || !taxId || !permissions) {
			return res.status(400).json({ message: 'Missing required parameters' })
		}
		const result = await enterprisesService.addUsers(
			userHashes,
			taxId,
			permissions,
			name,
			address
		)
		console.log('result: ', result)
		if (result.success) {
			return res.status(200).json({ message: 'Users added successfully' })
		} else {
			return res.status(500).json({ message: 'Failed to add users' })
		}
	} catch (error) {
		console.error('Error adding users:', error)
		return res.status(500).json({ message: 'Internal server error' })
	}
})

router.get('/enterprise/users', async (req, res) => {
	const userData = await enterprisesService.getUsers()

	if (userData.success) {
		return res.status(200).json({ data: userData })
	}
})

module.exports = router
