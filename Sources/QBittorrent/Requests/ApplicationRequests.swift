//
//  ApplicationRequests.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//
import APIClient
import Foundation

public extension Request {
	static var version: Request<String> {
		.init(name: "app", method: "version", transform: Request.singleValueTransform)
	}

	static var apiVersion: Request<String> {
		.init(name: "app", method: "webapiVersion", transform: Request.singleValueTransform)
	}

	static var buildInformation: Request<BuildInformation> {
		.init(name: "app", method: "buildInfo")
	}

	static var preferences: Request<ApplicationPreferences> {
		.init(name: "app", method: "preferences")
	}

	static func setPreferences(_ preferences: ApplicationPreferences) -> Request<QBittorrent.StatusResponse> {
		// TODO: diff the current preferences and the new preferences for a changeset?
		.init(
			name: "app",
			method: "setPreferences",
			body: JSONBody(preferences),
			transform: Self.statusResponse(data:response:)
		)
	}
}
