export const generateRandomNumber = (length: number) => {
	let result = ''
	const characters = '0123456789'
	const charactersLength = characters.length
	for (let i = 0; i < length; i++) {
		result += characters.charAt(Math.floor(Math.random() * charactersLength))
	}
	return result
}
export const generateRandomName = () => {
	const names = ['Amazon', 'Google', 'Facebook', 'Data-Lake']
	return names[Math.floor(Math.random() * names.length)]
}
