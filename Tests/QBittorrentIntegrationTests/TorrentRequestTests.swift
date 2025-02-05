//
//  TorrentRequestTests.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//

import Testing
import Foundation

@Suite("Torrent Requests", .serialized)
class TorrentRequestTests {
	@Test
	func test_torrent_info() async throws {
		let torrents = try await client.request(.torrents())
		print(torrents)
	}

	@Test
	func test_add_torrent() async throws {
		try await client.request(
			.addTorrent(urls: [urlForResource(named: TestConfig.torrent1)])
		)
	}

	@Test
	func test_stop_torrent() async throws {
		try await client.request(.stop(hashes: [TestConfig.torrent1Hash]))
	}

	@Test
	func test_start_torrent() async throws {
		try await client.request(.start(hashes: [TestConfig.torrent1Hash]))
	}

	@Test
	func test_delete_torrent() async throws {
		try await client.request(.delete(hashes: [TestConfig.torrent1Hash], deleteFiles: false))
	}

	@Test
	func test_recheck_torrent() async throws {
		try await client.request(.recheck(hashes: [TestConfig.torrent1Hash]))
	}

	@Test
	func test_add_tags_torrent() async throws {
		try await client.request(.addTags(tags: ["test_tag"]))
	}

	@Test
	func test_reannounce_torrent() async throws {
		try await client.request(.reannounce())
	}

	@Test
	func test_rename_file_torrent() async throws {
		try await client.request(
			.renameFile(
				hash: TestConfig.torrent1Hash,
				from: "debian-10.3.0-amd64-netinst.iso",
				to: "debian.iso"
			)
		)
	}

	@Test
	func test_contents() async throws {
		let contents = try await client.request(.contents(hash: TestConfig.torrent1Hash))
		print(contents)
	}
}
