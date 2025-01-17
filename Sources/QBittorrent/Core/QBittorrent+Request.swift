//
//  QBittorrent+Request.swift
//  QBittorrent
//
//  Created by ninji on 10/01/2025.
//
import APIClient
import Foundation

extension QBittorrent {
	public enum StatusResponse: String, Decodable {
		case ok = "Ok."
		case fails = "Fails."
	}
}

extension Request {
	init(
		name: String,
		method: String,
		httpMethod: HTTPMethod = .post,
		headers: HTTPFields = [:],
		body: RequestBody? = nil,
		transform: (@Sendable (Data, HTTPURLResponse) throws -> Value)? = nil
	) {
		self = .init(
			method: httpMethod,
			path: "\(name)/\(method)",
			headers: headers,
			body: body,
			transform: transform
		)
	}

	@discardableResult
	static func statusResponse(data: Data, response: HTTPURLResponse) throws -> QBittorrent.StatusResponse {
		return .init(rawValue: try singleValueTransform(data: data, response: response)) ?? .fails
	}

	static func singleValueTransform(data: Data, response: HTTPURLResponse) throws -> String {
	 guard let value = String(data: data, encoding: .utf8) else {
		 throw QBittorrentError.decoding(
			 DecodingError.valueNotFound(
				 String.self,
				 .init(
					 codingPath: [],
					 debugDescription: "Failed to decode single value string"
				 )
			 )
		 )
	 }

	 return value
 }
}

extension Request {
	private static func handleTransform(
		_ data: Data,
		response: HTTPURLResponse,
		injected: ((Data, HTTPURLResponse) throws -> Value)?
	) throws -> Value {
		do {
			if let injected {
				let transformed = try injected(data, response)
				return transformed
			}

			let response = try JSONDecoder().decode(Value.self, from: data)

			return response
		} catch let error as QBittorrentClient.Error {
			throw error
		} catch {
			throw QBittorrentClient.Error.decoding(error)
		}
	}
}
