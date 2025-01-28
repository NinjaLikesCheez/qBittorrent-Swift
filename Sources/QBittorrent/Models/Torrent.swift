//
//  Torrent.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//

public struct Torrent: Decodable {
	public let addedOn: Int
	public let amountLeft: Int
	public let autoTmm: Bool
	public let availability: Double
	public let category: String
	public let comment: String
	public let completed: Int
	public let completionOn: Int
	public let contentPath: String
	public let dlLimit: Int
	public let dlspeed: Int
	public let downloadPath: String
	public let downloaded: Int
	public let downloadedSession: Int
	public let eta: Int
	public let fLPiecePrio: Bool
	public let forceStart: Bool
	public let hasMetadata: Bool
	public let hash: String
	public let inactiveSeedingTimeLimit: Int
	public let infohashV1: String
	public let infohashV2: String
	public let lastActivity: Int
	public let magnetUri: String
	public let maxInactiveSeedingTime: Int
	public let maxRatio: Float
	public let maxSeedingTime: Int
	public let name: String
	public let numComplete: Int
	public let numIncomplete: Int
	public let numLeechs: Int
	public let numSeeds: Int
	public let popularity: Double
	public let priority: Priority
	public let `private`: Bool
	public let progress: Double
	public let ratio: Double
	public let ratioLimit: Double
	public let reannounce: Int
	public let rootPath: String
	public let savePath: String
	public let seedingTime: Int
	public let seedingTimeLimit: Int
	public let seenComplete: Int
	public let seqDl: Bool
	public let size: Int
	public let state: State
	public let superSeeding: Bool
	public let tags: String
	public let timeActive: Int
	public let totalSize: Int
	public let tracker: String
	public let trackersCount: Int
	public let upLimit: Int
	public let uploaded: Int
	public let uploadedSession: Int
	public let upspeed: Int

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
		case stoppedUpload = "stoppedUP"
		case queuedUpload = "queuedUP"
		case stalledUpload = "stalledUP"
		case checkingUpload = "checkingUP"
		case forcedUpload = "forcedUP"
		case metaDownload = "metaDL"
		case forcedMetaDownload = "forcedMetaDL"
		case stoppedDownload = "stoppedDL"
		case queuedDownload = "queuedDL"
		case stalledDownload = "stalledDL"
		case checkingDownload = "checkingDL"
		case forcedDownload = "forcedDL"
		case downloading
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
			case stalledUploading
			case stalledDownloading
			case errored
		}
	}

	public struct Tag: Decodable {
		public let name: String
	}

	public enum Priority: Int, Decodable {
		case doNotDownload = 0
		case low = 1
		case normal = 2
		case unknown = 3
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
