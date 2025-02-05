//
//  AuthenticationRequestTests.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//

import Testing

@Suite("Authentication Requests", .serialized)
class AuthenticationRequestTests {
	@Test
	func test_authenticate() async throws {
		let authenticated = try await client.request(.authenticate(username: client.username, password: client.password))
		#expect(authenticated == true)
	}
}
