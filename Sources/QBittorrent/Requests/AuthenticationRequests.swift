import APIClient
import Foundation

public extension QBittorrentRequest {
	static func authenticate(username: String, password: String) -> QBittorrentRequest<Bool> {
			.init(
				name: "auth",
				method: "login",
				body: { FormBody(["username": username, "password": password]) },
				transform: {
					try QBittorrentRequest.statusResponse(data: $0, response: $1) == .ok
				}
			)
		}
}
