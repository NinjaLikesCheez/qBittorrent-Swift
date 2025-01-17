//
//  ApplicationPreferences.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//

public struct ApplicationPreferences: Codable {
	let locale: String
	let createSubfolderEnabled: Bool?
	let startPausedEnabled: Bool?
	let autoDeleteMode: Int
	let preallocateAll: Bool
	let incompleteFilesExt: Bool
	let autoTmmEnabled: Bool
	let torrentChangedTmmEnabled: Bool
	let savePathChangedTmmEnabled: Bool
	let categoryChangedTmmEnabled: Bool
	let savePath: String
	let tempPathEnabled: Bool
	let tempPath: String
	let scanDirs: ScanDirs
	let exportDir: String
	let exportDirFin: String
	let mailNotificationEnabled: Bool
	let mailNotificationSender: String
	let mailNotificationEmail: String
	let mailNotificationSmtp: String
	let mailNotificationSslEnabled: Bool
	let mailNotificationAuthEnabled: Bool
	let mailNotificationUsername: String
	let mailNotificationPassword: String
	let autorunEnabled: Bool
	let autorunProgram: String
	let queueingEnabled: Bool
	let maxActiveDownloads: Int
	let maxActiveTorrents: Int
	let maxActiveUploads: Int
	let dontCountSlowTorrents: Bool
	let slowTorrentDlRateThreshold: Int
	let slowTorrentUlRateThreshold: Int
	let slowTorrentInactiveTimer: Int
	let maxRatioEnabled: Bool
	let maxRatio: Float
	let maxRatioAct: MaxRatioAction
	let listenPort: Int
	let upnp: Bool
	let randomPort: Bool
	let dlLimit: Int
	let upLimit: Int
	let maxConnec: Int
	let maxConnecPerTorrent: Int
	let maxUploads: Int
	let maxUploadsPerTorrent: Int
	let stopTrackerTimeout: Int
	let enablePieceExtentAffinity: Bool
	let bittorrentProtocol: Int
	let limitUtpRate: Bool
	let limitTcpOverhead: Bool
	let limitLanPeers: Bool
	let altDlLimit: Int
	let altUpLimit: Int
	let schedulerEnabled: Bool
	let scheduleFromHour: Int
	let scheduleFromMin: Int
	let scheduleToHour: Int
	let scheduleToMin: Int
	let schedulerDays: SchedulerDays
	let dht: Bool
	let pex: Bool
	let lsd: Bool
	let encryption: Encryption
	let anonymousMode: Bool
	let proxyType: ProxyType
	let proxyIp: String
	let proxyPort: Int
	let proxyPeerConnections: Bool
	let proxyAuthEnabled: Bool
	let proxyUsername: String
	let proxyPassword: String
	let proxyTorrentsOnly: Bool?
	let ipFilterEnabled: Bool
	let ipFilterPath: String
	let ipFilterTrackers: Bool
	let webUiDomainList: String
	let webUiAddress: String
	let webUiPort: Int
	let webUiUpnp: Bool
	let webUiUsername: String
	let webUiPassword: String?
	let webUiCsrfProtectionEnabled: Bool
	let webUiClickjackingProtectionEnabled: Bool
	let webUiSecureCookieEnabled: Bool
	let webUiMaxAuthFailCount: Int
	let webUiBanDuration: Int
	let webUiSessionTimeout: Int
	let webUiHostHeaderValidationEnabled: Bool
	let bypassLocalAuth: Bool
	let bypassAuthSubnetWhitelistEnabled: Bool
	let bypassAuthSubnetWhitelist: String
	let alternativeWebuiEnabled: Bool
	let alternativeWebuiPath: String
	let useHttps: Bool
	let sslKey: String?
	let sslCert: String?
	let webUiHttpsKeyPath: String
	let webUiHttpsCertPath: String
	let dyndnsEnabled: Bool
	let dyndnsService: dynDNSService
	let dyndnsUsername: String
	let dyndnsPassword: String
	let dyndnsDomain: String
	let rssRefreshInterval: Int
	let rssMaxArticlesPerFeed: Int
	let rssProcessingEnabled: Bool
	let rssAutoDownloadingEnabled: Bool
	let rssDownloadRepackProperEpisodes: Bool
	let rssSmartEpisodeFilters: String
	let addTrackersEnabled: Bool
	let addTrackers: String
	let webUiUseCustomHttpHeadersEnabled: Bool
	let webUiCustomHttpHeaders: String
	let maxSeedingTimeEnabled: Bool
	let maxSeedingTime: Int
	let announceIp: String
	let announceToAllTiers: Bool
	let announceToAllTrackers: Bool
	let asyncIoThreads: Int
	let bannedIps: String
	let checkingMemoryUse: Int
	let currentInterfaceAddress: String
	let currentNetworkInterface: String
	let diskCache: Int
	let diskCacheTtl: Int
	let embeddedTrackerPort: Int
	let enableCoalesceReadWrite: Bool
	let enableEmbeddedTracker: Bool
	let enableMultiConnectionsFromSameIp: Bool
	let enableOsCache: Bool?
	let enableUploadSuggestions: Bool
	let filePoolSize: Int
	let outgoingPortsMax: Int
	let outgoingPortsMin: Int
	let recheckCompletedTorrents: Bool
	let resolvePeerCountries: Bool
	let saveResumeDataInterval: Int
	let sendBufferLowWatermark: Int
	let sendBufferWatermark: Int
	let sendBufferWatermarkFactor: Int
	let socketBacklogSize: Int
	let uploadChokingAlgorithm: UploadChokingAlgorithm
	let uploadSlotsBehavior: UploadSlotBehavior
	let upnpLeaseDuration: Int
	let utpTcpMixedMode: UTPTCPMixedMode

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
