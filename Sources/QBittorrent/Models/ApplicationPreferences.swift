//
//  ApplicationPreferences.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//

public struct ApplicationPreferences: Codable {
	public let locale: String
	public let createSubfolderEnabled: Bool?
	public let startPausedEnabled: Bool?
	public let autoDeleteMode: Int
	public let preallocateAll: Bool
	public let incompleteFilesExt: Bool
	public let autoTmmEnabled: Bool
	public let torrentChangedTmmEnabled: Bool
	public let savePathChangedTmmEnabled: Bool
	public let categoryChangedTmmEnabled: Bool
	public let savePath: String
	public let tempPathEnabled: Bool
	public let tempPath: String
	public let scanDirs: ScanDirs
	public let exportDir: String
	public let exportDirFin: String
	public let mailNotificationEnabled: Bool
	public let mailNotificationSender: String
	public let mailNotificationEmail: String
	public let mailNotificationSmtp: String
	public let mailNotificationSslEnabled: Bool
	public let mailNotificationAuthEnabled: Bool
	public let mailNotificationUsername: String
	public let mailNotificationPassword: String
	public let autorunEnabled: Bool
	public let autorunProgram: String
	public let queueingEnabled: Bool
	public let maxActiveDownloads: Int
	public let maxActiveTorrents: Int
	public let maxActiveUploads: Int
	public let dontCountSlowTorrents: Bool
	public let slowTorrentDlRateThreshold: Int
	public let slowTorrentUlRateThreshold: Int
	public let slowTorrentInactiveTimer: Int
	public let maxRatioEnabled: Bool
	public let maxRatio: Float
	public let maxRatioAct: MaxRatioAction
	public let listenPort: Int
	public let upnp: Bool
	public let randomPort: Bool
	public let dlLimit: Int
	public let upLimit: Int
	public let maxConnec: Int
	public let maxConnecPerTorrent: Int
	public let maxUploads: Int
	public let maxUploadsPerTorrent: Int
	public let stopTrackerTimeout: Int
	public let enablePieceExtentAffinity: Bool
	public let bittorrentProtocol: Int
	public let limitUtpRate: Bool
	public let limitTcpOverhead: Bool
	public let limitLanPeers: Bool
	public let altDlLimit: Int
	public let altUpLimit: Int
	public let schedulerEnabled: Bool
	public let scheduleFromHour: Int
	public let scheduleFromMin: Int
	public let scheduleToHour: Int
	public let scheduleToMin: Int
	public let schedulerDays: SchedulerDays
	public let dht: Bool
	public let pex: Bool
	public let lsd: Bool
	public let encryption: Encryption
	public let anonymousMode: Bool
	public let proxyType: ProxyType
	public let proxyIp: String
	public let proxyPort: Int
	public let proxyPeerConnections: Bool
	public let proxyAuthEnabled: Bool
	public let proxyUsername: String
	public let proxyPassword: String
	public let proxyTorrentsOnly: Bool?
	public let ipFilterEnabled: Bool
	public let ipFilterPath: String
	public let ipFilterTrackers: Bool
	public let webUiDomainList: String
	public let webUiAddress: String
	public let webUiPort: Int
	public let webUiUpnp: Bool
	public let webUiUsername: String
	public let webUiPassword: String?
	public let webUiCsrfProtectionEnabled: Bool
	public let webUiClickjackingProtectionEnabled: Bool
	public let webUiSecureCookieEnabled: Bool
	public let webUiMaxAuthFailCount: Int
	public let webUiBanDuration: Int
	public let webUiSessionTimeout: Int
	public let webUiHostHeaderValidationEnabled: Bool
	public let bypassLocalAuth: Bool
	public let bypassAuthSubnetWhitelistEnabled: Bool
	public let bypassAuthSubnetWhitelist: String
	public let alternativeWebuiEnabled: Bool
	public let alternativeWebuiPath: String
	public let useHttps: Bool
	public let sslKey: String?
	public let sslCert: String?
	public let webUiHttpsKeyPath: String
	public let webUiHttpsCertPath: String
	public let dyndnsEnabled: Bool
	public let dyndnsService: dynDNSService
	public let dyndnsUsername: String
	public let dyndnsPassword: String
	public let dyndnsDomain: String
	public let rssRefreshInterval: Int
	public let rssMaxArticlesPerFeed: Int
	public let rssProcessingEnabled: Bool
	public let rssAutoDownloadingEnabled: Bool
	public let rssDownloadRepackProperEpisodes: Bool
	public let rssSmartEpisodeFilters: String
	public let addTrackersEnabled: Bool
	public let addTrackers: String
	public let webUiUseCustomHttpHeadersEnabled: Bool
	public let webUiCustomHttpHeaders: String
	public let maxSeedingTimeEnabled: Bool
	public let maxSeedingTime: Int
	public let announceIp: String
	public let announceToAllTiers: Bool
	public let announceToAllTrackers: Bool
	public let asyncIoThreads: Int
	public let bannedIps: String
	public let checkingMemoryUse: Int
	public let currentInterfaceAddress: String
	public let currentNetworkInterface: String
	public let diskCache: Int
	public let diskCacheTtl: Int
	public let embeddedTrackerPort: Int
	public let enableCoalesceReadWrite: Bool
	public let enableEmbeddedTracker: Bool
	public let enableMultiConnectionsFromSameIp: Bool
	public let enableOsCache: Bool?
	public let enableUploadSuggestions: Bool
	public let filePoolSize: Int
	public let outgoingPortsMax: Int
	public let outgoingPortsMin: Int
	public let recheckCompletedTorrents: Bool
	public let resolvePeerCountries: Bool
	public let saveResumeDataInterval: Int
	public let sendBufferLowWatermark: Int
	public let sendBufferWatermark: Int
	public let sendBufferWatermarkFactor: Int
	public let socketBacklogSize: Int
	public let uploadChokingAlgorithm: UploadChokingAlgorithm
	public let uploadSlotsBehavior: UploadSlotBehavior
	public let upnpLeaseDuration: Int
	public let utpTcpMixedMode: UTPTCPMixedMode

	func encode() -> [String: Any] {
		var dict = [String: Any]()
		dict["locale"] = locale
		dict["createSubfolderEnabled"] = createSubfolderEnabled
		dict["startPausedEnabled"] = startPausedEnabled
		dict["autoDeleteMode"] = autoDeleteMode
		dict["preallocateAll"] = preallocateAll
		dict["incompleteFilesExt"] = incompleteFilesExt
		dict["autoTmmEnabled"] = autoTmmEnabled
		dict["torrentChangedTmmEnabled"] = torrentChangedTmmEnabled
		dict["savePathChangedTmmEnabled"] = savePathChangedTmmEnabled
		dict["categoryChangedTmmEnabled"] = categoryChangedTmmEnabled
		dict["savePath"] = savePath
		dict["tempPathEnabled"] = tempPathEnabled
		dict["tempPath"] = tempPath
		dict["scanDirs"] = scanDirs
		dict["exportDir"] = exportDir
		dict["exportDirFin"] = exportDirFin
		dict["mailNotificationEnabled"] = mailNotificationEnabled
		dict["mailNotificationSender"] = mailNotificationSender
		dict["mailNotificationEmail"] = mailNotificationEmail
		dict["mailNotificationSmtp"] = mailNotificationSmtp
		dict["mailNotificationSslEnabled"] = mailNotificationSslEnabled
		dict["mailNotificationAuthEnabled"] = mailNotificationAuthEnabled
		dict["mailNotificationUsername"] = mailNotificationUsername
		dict["mailNotificationPassword"] = mailNotificationPassword
		dict["autorunEnabled"] = autorunEnabled
		dict["autorunProgram"] = autorunProgram
		dict["queueingEnabled"] = queueingEnabled
		dict["maxActiveDownloads"] = maxActiveDownloads
		dict["maxActiveTorrents"] = maxActiveTorrents
		dict["maxActiveUploads"] = maxActiveUploads
		dict["dontCountSlowTorrents"] = dontCountSlowTorrents
		dict["slowTorrentDlRateThreshold"] = slowTorrentDlRateThreshold
		dict["slowTorrentUlRateThreshold"] = slowTorrentUlRateThreshold
		dict["slowTorrentInactiveTimer"] = slowTorrentInactiveTimer
		dict["maxRatioEnabled"] = maxRatioEnabled
		dict["maxRatio"] = maxRatio
		dict["maxRatioAct"] = maxRatioAct
		dict["listenPort"] = listenPort
		dict["upnp"] = upnp
		dict["randomPort"] = randomPort
		dict["dlLimit"] = dlLimit
		dict["upLimit"] = upLimit
		dict["maxConnec"] = maxConnec
		dict["maxConnecPerTorrent"] = maxConnecPerTorrent
		dict["maxUploads"] = maxUploads
		dict["maxUploadsPerTorrent"] = maxUploadsPerTorrent
		dict["stopTrackerTimeout"] = stopTrackerTimeout
		dict["enablePieceExtentAffinity"] = enablePieceExtentAffinity
		dict["bittorrentProtocol"] = bittorrentProtocol
		dict["limitUtpRate"] = limitUtpRate
		dict["limitTcpOverhead"] = limitTcpOverhead
		dict["limitLanPeers"] = limitLanPeers
		dict["altDlLimit"] = altDlLimit
		dict["altUpLimit"] = altUpLimit
		dict["schedulerEnabled"] = schedulerEnabled
		dict["scheduleFromHour"] = scheduleFromHour
		dict["scheduleFromMin"] = scheduleFromMin
		dict["scheduleToHour"] = scheduleToHour
		dict["scheduleToMin"] = scheduleToMin
		dict["schedulerDays"] = schedulerDays
		dict["dht"] = dht
		dict["pex"] = pex
		dict["lsd"] = lsd
		dict["encryption"] = encryption
		dict["anonymousMode"] = anonymousMode
		dict["proxyType"] = proxyType
		dict["proxyIp"] = proxyIp
		dict["proxyPort"] = proxyPort
		dict["proxyPeerConnections"] = proxyPeerConnections
		dict["proxyAuthEnabled"] = proxyAuthEnabled
		dict["proxyUsername"] = proxyUsername
		dict["proxyPassword"] = proxyPassword
		dict["proxyTorrentsOnly"] = proxyTorrentsOnly
		dict["ipFilterEnabled"] = ipFilterEnabled
		dict["ipFilterPath"] = ipFilterPath
		dict["ipFilterTrackers"] = ipFilterTrackers
		dict["webUiDomainList"] = webUiDomainList
		dict["webUiAddress"] = webUiAddress
		dict["webUiPort"] = webUiPort
		dict["webUiUpnp"] = webUiUpnp
		dict["webUiUsername"] = webUiUsername
		dict["webUiPassword"] = webUiPassword
		dict["webUiCsrfProtectionEnabled"] = webUiCsrfProtectionEnabled
		dict["webUiClickjackingProtectionEnabled"] = webUiClickjackingProtectionEnabled
		dict["webUiSecureCookieEnabled"] = webUiSecureCookieEnabled
		dict["webUiMaxAuthFailCount"] = webUiMaxAuthFailCount
		dict["webUiBanDuration"] = webUiBanDuration
		dict["webUiSessionTimeout"] = webUiSessionTimeout
		dict["webUiHostHeaderValidationEnabled"] = webUiHostHeaderValidationEnabled
		dict["bypassLocalAuth"] = bypassLocalAuth
		dict["bypassAuthSubnetWhitelistEnabled"] = bypassAuthSubnetWhitelistEnabled
		dict["bypassAuthSubnetWhitelist"] = bypassAuthSubnetWhitelist
		dict["alternativeWebuiEnabled"] = alternativeWebuiEnabled
		dict["alternativeWebuiPath"] = alternativeWebuiPath
		dict["useHttps"] = useHttps
		dict["sslKey"] = sslKey
		dict["sslCert"] = sslCert
		dict["webUiHttpsKeyPath"] = webUiHttpsKeyPath
		dict["webUiHttpsCertPath"] = webUiHttpsCertPath
		dict["dyndnsEnabled"] = dyndnsEnabled
		dict["dyndnsService"] = dyndnsService
		dict["dyndnsUsername"] = dyndnsUsername
		dict["dyndnsPassword"] = dyndnsPassword
		dict["dyndnsDomain"] = dyndnsDomain
		dict["rssRefreshInterval"] = rssRefreshInterval
		dict["rssMaxArticlesPerFeed"] = rssMaxArticlesPerFeed
		dict["rssProcessingEnabled"] = rssProcessingEnabled
		dict["rssAutoDownloadingEnabled"] = rssAutoDownloadingEnabled
		dict["rssDownloadRepackProperEpisodes"] = rssDownloadRepackProperEpisodes
		dict["rssSmartEpisodeFilters"] = rssSmartEpisodeFilters
		dict["addTrackersEnabled"] = addTrackersEnabled
		dict["addTrackers"] = addTrackers
		dict["webUiUseCustomHttpHeadersEnabled"] = webUiUseCustomHttpHeadersEnabled
		dict["webUiCustomHttpHeaders"] = webUiCustomHttpHeaders
		dict["maxSeedingTimeEnabled"] = maxSeedingTimeEnabled
		dict["maxSeedingTime"] = maxSeedingTime
		dict["announceIp"] = announceIp
		dict["announceToAllTiers"] = announceToAllTiers
		dict["announceToAllTrackers"] = announceToAllTrackers
		dict["asyncIoThreads"] = asyncIoThreads
		dict["bannedIps"] = bannedIps
		dict["checkingMemoryUse"] = checkingMemoryUse
		dict["currentInterfaceAddress"] = currentInterfaceAddress
		dict["currentNetworkInterface"] = currentNetworkInterface
		dict["diskCache"] = diskCache
		dict["diskCacheTtl"] = diskCacheTtl
		dict["embeddedTrackerPort"] = embeddedTrackerPort
		dict["enableCoalesceReadWrite"] = enableCoalesceReadWrite
		dict["enableEmbeddedTracker"] = enableEmbeddedTracker
		dict["enableMultiConnectionsFromSameIp"] = enableMultiConnectionsFromSameIp
		dict["enableOsCache"] = enableOsCache
		dict["enableUploadSuggestions"] = enableUploadSuggestions
		dict["filePoolSize"] = filePoolSize
		dict["outgoingPortsMax"] = outgoingPortsMax
		dict["outgoingPortsMin"] = outgoingPortsMin
		dict["recheckCompletedTorrents"] = recheckCompletedTorrents
		dict["resolvePeerCountries"] = resolvePeerCountries
		dict["saveResumeDataInterval"] = saveResumeDataInterval
		dict["sendBufferLowWatermark"] = sendBufferLowWatermark
		dict["sendBufferWatermark"] = sendBufferWatermark
		dict["sendBufferWatermarkFactor"] = sendBufferWatermarkFactor
		dict["socketBacklogSize"] = socketBacklogSize
		dict["uploadChokingAlgorithm"] = uploadChokingAlgorithm
		dict["uploadSlotsBehavior"] = uploadSlotsBehavior
		dict["upnpLeaseDuration"] = upnpLeaseDuration
		dict["utpTcpMixedMode"] = utpTcpMixedMode
		return dict
	}

	public enum ScanDirs: Codable {
		case monitoredPath
		case defaultSavePath
		case path(String)
		case none

		public init(from decoder: any Decoder) throws {
			let container = try decoder.singleValueContainer()

			if let value = try? container.decode(Int.self) {
				switch value {
				case 0:
					self = .monitoredPath
				case 1:
					self = .defaultSavePath
				default:
					throw DecodingError.dataCorrupted(
						.init(codingPath: decoder.codingPath, debugDescription: "expected 0 or 1, found: \(value)")
					)
				}
			} else if let value = try? container.decode(String.self) {
				self = .path(value)
			} else {
				self = .none
			}
		}
	}

	public enum ProxyType: Codable {
		case none
		case disabled
		case http(authentication: Bool)
		case socks5(authentication: Bool)
		case socks4

		public init(from decoder: any Decoder) throws {
			let container = try decoder.singleValueContainer()

			if let value = try? container.decode(Int.self) {
				self = switch value {
				case -1: .disabled
				case 1: .http(authentication: false)
				case 2: .socks5(authentication: false)
				case 3: .http(authentication: true)
				case 4: .socks5(authentication: true)
				case 5: .socks4
				default:
					throw DecodingError.dataCorrupted(
						.init(codingPath: [], debugDescription: "Expected an Int value between -1 & 5, got: \(value)")
					)
				}
			}

			self = .none
		}
	}

	public enum SchedulerDays: Int, Codable {
		case everyDay
		case everyWeekday
		case everyMonday
		case everyTuesday
		case everyWednesday
		case everyThursday
		case everyFriday
		case everySaturday
		case everySunday
	}

	public enum Encryption: Int, Codable {
		case prefer
		case forceOn
		case forceOff
	}

	public enum dynDNSService: Int, Codable {
		case dynDSN
		case noIP
	}

	public enum MaxRatioAction: Int, Codable {
		case pause
		case remove
	}

	public enum BittorrentProtocol: Int, Codable {
		case tcpAndΜTP
		case tcp
		case μTP
	}

	public enum UploadChokingAlgorithm: Int, Codable {
		case roundRobin
		case fastestUpload
		case antiLeech
	}

	public enum UploadSlotBehavior: Int, Codable {
		case fixedSlots
		case uploadRateBased
	}

	public enum UTPTCPMixedMode: Int, Codable {
		case preferTCP
		case peerProportional
	}
}
