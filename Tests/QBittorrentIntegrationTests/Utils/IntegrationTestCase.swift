import QBittorrent

let client = QBittorrent(
		baseURL: TestConfig.serverURL,
		username: TestConfig.serverUsername,
		password: TestConfig.serverPassword
	)
