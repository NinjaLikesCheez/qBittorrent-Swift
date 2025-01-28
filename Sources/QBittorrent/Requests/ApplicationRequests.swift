//
//  ApplicationRequests.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//
import APIClient
import Foundation

public extension QBittorrentRequest {
	static var version: QBittorrentRequest<String> {
		.init(name: "app", method: "version", transform: QBittorrentRequest.singleValueTransform)
	}

	static var apiVersion: QBittorrentRequest<String> {
		.init(name: "app", method: "webapiVersion", transform: QBittorrentRequest.singleValueTransform)
	}

	static var buildInformation: QBittorrentRequest<BuildInformation> {
		.init(name: "app", method: "buildInfo")
	}

	static var preferences: QBittorrentRequest<ApplicationPreferences> {
		.init(name: "app", method: "preferences")
	}

	static func setPreferences(_ preferences: ApplicationPreferences) -> QBittorrentRequest<QBittorrent.StatusResponse> {
		// TODO: diff the current preferences and the new preferences for a changeset?
		.init(
			name: "app",
			method: "setPreferences",
			body: JSONBody(preferences),
			transform: Self.statusResponse(data:response:)
		)
	}
}
