//
//  BuildInformation.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//

public struct BuildInformation: Decodable {
	let qt: String
	let libTorrent: String
	let boost: String
	let openssl: String
	let bitness: Int

	enum CodingKeys: String, CodingKey {
		case qt
		case libTorrent = "libtorrent"
		case boost
		case openssl
		case bitness
	}
}
