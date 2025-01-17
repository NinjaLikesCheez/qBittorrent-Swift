//
//  TorrentsRequests.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//
import APIClient
import Foundation

public extension Request {
	static func torrents(
		filter: Torrent.State.Filter? = nil,
		category: String? = nil,
		tag: String? = nil,
		sort: Torrent.CodingKeys? = nil,
		reverse: Bool? = nil,
		limit: Int? = nil,
		offset: Int? = nil,
		hashes: String? = nil
	) -> Request<[Torrent]> {
		var body = [String: String]()

		if let filter {
			body["filter"] = filter.rawValue
		} else if let category {
			body["category"] = category
		} else if let tag {
			body["tag"] = tag
		} else if let sort {
			body["sort"] = sort.rawValue
		} else if let reverse {
			body["reverse"] = String(reverse)
		} else if let limit {
			body["limit"] = String(limit)
		} else if let offset {
			body["offset"] = String(offset)
		} else if let hashes {
			body["hashes"] = hashes
		}

		return .init(
			name: "torrents",
			method: "info",
			body: FormBody(body)
		)
	}

	static func stop(hashes: [String] = ["all"]) -> Request<QBittorrent.StatusResponse> {
		.init(
			name: "torrents",
			method: "stop", // Yes this is called stop even though the docs say pause..........
			body: FormBody(["hashes": hashes.joined(separator: "|")]),
			transform: Self.statusResponse(data:response:)
		)
	}

	static func resume(hashes: [String] = ["all"]) -> Request<QBittorrent.StatusResponse> {
		.init(
			name: "torrents",
			method: "start",
			body: FormBody(["hashes": hashes.joined(separator: "|")]),
			transform: Self.statusResponse(data:response:)
		)
	}

	// Pass "all" as hashes to remove all torrents
	static func delete(hashes: [String], deleteFiles: Bool) -> Request<QBittorrent.StatusResponse> {
		.init(
			name: "torrents",
			method: "delete",
			body: FormBody(["hashes": hashes.joined(separator: "|"), "deleteFiles": String(deleteFiles)]),
			transform: Self.statusResponse(data:response:)
		)
	}

	static func recheck(hashes: [String] = ["all"]) -> Request<QBittorrent.StatusResponse> {
		.init(
			name: "torrents",
			method: "recheck",
			body: FormBody(["hashes": hashes.joined(separator: "|")]),
			transform: Self.statusResponse(data:response:)
		)
	}

	static func addTags(_ hashes: [String] = ["all"], tags: [String]) -> Request<QBittorrent.StatusResponse> {
		.init(
			name: "torrents",
			method: "addTags",
			body: FormBody(["hashes": hashes.joined(separator: "|"), "tags": tags.joined(separator: ",")]),
			transform: Self.statusResponse(data:response:)
		)
	}

	static func addTorrent(
		urls: Set<URL>,
		savePath: String? = nil,
		cookie: String? = nil,
		category: String? = nil,
		tags: String? = nil,
		skipChecking: String? = nil,
		paused: String? = nil,
		rootFolder: String? = nil,
		rename: String? = nil,
		upLimit: Int? = nil,
		dlLimit: Int? = nil,
		ratioLimit: Int? = nil,
		seedingTimeLimit: Int? = nil,
		autoTMM: Bool? = nil,
		sequentialDownload: String? = nil,
		firstLastPiecePrio: String? = nil
	) throws -> Request<QBittorrent.StatusResponse> {
		var values = [MultipartFormBody.FormValue]()

		let files = urls.filter({ $0.isFileURL })
		let webURLs = urls.subtracting(files)

		try files.forEach { url in
			values.append(
				.filename(
					key: "torrents",
					filename: url.lastPathComponent,
					value: try Data(contentsOf: url),
					contentType: "application/x-bittorrent")
			)
		}

		if !webURLs.isEmpty {
			let allWebURLs = webURLs
				.map { $0.absoluteString }
				.joined(separator: "\r\n")

			values.append(.name(key: "urls", value: allWebURLs))
		}

		if let savePath {
			values.append(.name(key: "savepath", value: savePath))
		}
		if let cookie {
			values.append(.name(key: "cooki", value: cookie))
		}
		if let category {
			values.append(.name(key: "category", value: category))
		}
		if let tags {
			values.append(.name(key: "tags", value: tags))
		}
		if let skipChecking {
			values.append(.name(key: "skip_checking", value: skipChecking))
		}
		if let paused {
			values.append(.name(key: "paused", value: paused))
		}
		if let rootFolder {
			values.append(.name(key: "root_folder", value: rootFolder))
		}
		if let rename {
			values.append(.name(key: "rename", value: rename))
		}
		if let upLimit {
			values.append(.name(key: "upLimit", value: String(upLimit)))
		}
		if let dlLimit {
			values.append(.name(key: "dlLimit", value: String(dlLimit)))
		}
		if let ratioLimit {
			values.append(.name(key: "ratioLimit", value: String(ratioLimit)))
		}
		if let seedingTimeLimit {
			values.append(.name(key: "seedingTimeLimit", value: String(seedingTimeLimit)))
		}
		if let autoTMM {
			values.append(.name(key: "autoTMM", value: String(autoTMM)))
		}
		if let sequentialDownload {
			values.append(.name(key: "sequentialDownload", value: sequentialDownload))
		}
		if let firstLastPiecePrio {
			values.append(.name(key: "firstLastPiecePrio", value: firstLastPiecePrio))
		}

		return .init(
			name: "torrents",
			method: "add",
			body: MultipartFormBody(values),
			transform: Self.statusResponse(data:response:)
		)
	}

	static func reannounce(hashes: [String] = ["all"]) -> Request<QBittorrent.StatusResponse> {
		.init(
			name: "torrents",
			method: "reannounce",
			body: FormBody(["hashes": hashes.joined(separator: "|")]),
			transform: Self.statusResponse(data:response:)
		)
	}

	static func renameFolder(hash: String, from oldPath: String, to newPath: String) -> Request<QBittorrent.StatusResponse> {
		.init(
			name: "torrents",
			method: "renameFolder",
			body: FormBody(["hash": hash, "oldPath": oldPath, "newPath": newPath]),
			transform: Self.statusResponse(data:response:)
		)
	}

	static func renameFile(hash: String, from oldPath: String, to newPath: String) -> Request<QBittorrent.StatusResponse> {
		.init(
			name: "torrents",
			method: "renameFile",
			body: FormBody(["hash": hash, "oldPath": oldPath, "newPath": newPath]),
			transform: Self.statusResponse(data:response:)
		)
	}
}
