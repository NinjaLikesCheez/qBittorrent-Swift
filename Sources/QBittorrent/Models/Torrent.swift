//
//  Torrent.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//

public struct Torrent: Decodable {
	let addedOn: Int
	let amountLeft: Int
	let autoTmm: Bool
	let availability: Double
	let category: String
	let comment: String
	let completed: Int
	let completionOn: Int
	let contentPath: String
	let dlLimit: Int
	let dlspeed: Int
	let downloadPath: String
	let downloaded: Int
	let downloadedSession: Int
	let eta: Int
	let fLPiecePrio: Bool
	let forceStart: Bool
	let hasMetadata: Bool
	let hash: String
	let inactiveSeedingTimeLimit: Int
	let infohashV1: String
	let infohashV2: String
	let lastActivity: Int
	let magnetUri: String
	let maxInactiveSeedingTime: Int
	let maxRatio: Float
	let maxSeedingTime: Int
	let name: String
	let numComplete: Int
	let numIncomplete: Int
	let numLeechs: Int
	let numSeeds: Int
	let popularity: Double
	let priority: Priority
	let `private`: Bool
	let progress: Double
	let ratio: Double
	let ratioLimit: Double
	let reannounce: Int
	let rootPath: String
	let savePath: String
	let seedingTime: Int
	let seedingTimeLimit: Int
	let seenComplete: Int
	let seqDl: Bool
	let size: Int
	let state: String
	let superSeeding: Bool
	let tags: [Tag]
	let timeActive: Int
	let totalSize: Int
	let tracker: String
	let trackersCount: Int
	let upLimit: Int
	let uploaded: Int
	let uploadedSession: Int
	let upspeed: Int

	public enum CodingKeys: String, CodingKey {
		case addedOn
		case amountLeft
		case autoTmm
		case availability
		case category
		case comment
		case completed
		case completionOn
		case contentPath
		case dlLimit
		case dlspeed
		case downloadPath
		case downloaded
		case downloadedSession
		case eta
		case fLPiecePrio
		case forceStart
		case hasMetadata
		case hash
		case inactiveSeedingTimeLimit
		case infohashV1
		case infohashV2
		case lastActivity
		case magnetUri
		case maxInactiveSeedingTime
		case maxRatio
		case maxSeedingTime
		case name
		case numComplete
		case numIncomplete
		case numLeechs
		case numSeeds
		case popularity
		case priority
		case `private`
		case progress
		case ratio
		case ratioLimit
		case reannounce
		case rootPath
		case savePath
		case seedingTime
		case seedingTimeLimit
		case seenComplete
		case seqDl
		case size
		case state
		case superSeeding
		case tags
		case timeActive
		case totalSize
		case tracker
		case trackersCount
		case upLimit
		case uploaded
		case uploadedSession
		case upspeed
	}

	public enum State: String, Decodable {
		case error
		case missingFiles
		case uploading
		case pausedUpload = "pausedUP"
		case queuedUpload = "queuedUP"
		case stalledUpload = "stalledUP"
		case checkingUpload = "checkingUP"
		case forcedUpload = "forcedUP"
		case allocating
		case downloading
		case metaDownload = "metaDL"
		case pausedDownload = "pausedDL"
		case queuedDownload = "queuedDL"
		case stalledDownload = "stalledDL"
		case checkingDownload = "checkingDL"
		case forcedDownload = "forcedDL"
		case checkingResumeData
		case moving
		case unknown

		public enum Filter: String {
			case all
			case downloading
			case seeding
			case completed
			case paused
			case active
			case inactive
			case resumed
			case stalled
			case stalled_uploading
			case stalled_downloading
			case errored
		}
	}

	public struct Tag: Decodable {
		let name: String
	}

	public enum Priority: Int, Decodable {
		case doNotDownload = 0
		case low = 1
		case normal = 2
		case high = 6
		case maximal = 7
	}

	public struct Content: Decodable {
		public let index: Int
		public let name: String
		public let size: Int
		public let progress: Double
		public let priority: Priority
		public let isSeed: Bool
		public let pieceRange: [Int]
		public let availability: Double
	}
}
