export const useEnterprise = () => {
	const baseURL = 'http://localhost:4000'
	const getAllUsers = async () => {
		try {
			const response = await fetch(`${baseURL}/enterprise/users`, {
				method: 'GET',
			})
			if (!response.ok) {
				throw new Error('Failed to fetch users')
			}
			const data = await response.json()
			return data
		} catch (error) {
			console.error('Error fetching users:', error)
		}
	}
	return { getAllUsers }
}
