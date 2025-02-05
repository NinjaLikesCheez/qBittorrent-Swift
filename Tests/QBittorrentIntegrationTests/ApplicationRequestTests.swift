//
//  AuthenticationRequestTests.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//

import Testing

@Suite("Application Requests", .serialized)
class ApplicationRequestTests {
	@Test
	func test_version() async throws {
		try await client.request(.version)
	}

	@Test
	func test_api_version() async throws {
		try await client.request(.apiVersion)
	}

	@Test
	func test_build_information() async throws {
		try await client.request(.buildInformation)
	}

	@Test
	func test_preferences() async throws {
		try await client.request(.preferences)
	}
}
