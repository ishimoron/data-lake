module.exports = {
	testMatch: ['<rootDir>/tests/**/*.spec.js'],
	coverageReporters: ['json', 'html'],
	coverageDirectory: '<rootDir>/coverage',
	coveragePathIgnorePatterns: ['/node_modules/'],
}
