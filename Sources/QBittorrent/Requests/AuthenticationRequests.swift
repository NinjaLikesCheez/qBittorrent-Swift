import APIClient
import Foundation

public extension Request {
	static func authenticate(username: String, password: String) -> Request<Bool> {
			.init(
				name: "auth",
				method: "login",
				body: FormBody(["username": username, "password": password]),
				transform: {
					try Request.statusResponse(data: $0, response: $1) == .ok
				}
			)
		}
}

