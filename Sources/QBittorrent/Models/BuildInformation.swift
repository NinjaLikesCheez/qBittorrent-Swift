//
//  BuildInformation.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//

public struct BuildInformation: Decodable {
	public let qt: String
	public let libTorrent: String
	public let boost: String
	public let openssl: String
	public let bitness: Int

	enum CodingKeys: String, CodingKey {
		case qt
		case libTorrent = "libtorrent"
		case boost
		case openssl
		case bitness
	}
}
