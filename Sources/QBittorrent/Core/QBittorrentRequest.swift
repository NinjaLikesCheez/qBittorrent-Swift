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

public struct QBittorrentRequest<QBittorrentResponse: Decodable>: Request {
	public typealias Response = QBittorrentResponse

	public var method: HTTPMethod
	public var path: String?
	public var headers: HTTPFields
	public var body: () throws -> RequestBody?
	public var prepare: ((URLRequest) -> URLRequest)
	public var transform: ((Data, HTTPURLResponse) throws -> Response)?

	init(
		name: String,
		method: String,
		httpMethod: HTTPMethod = .post,
		headers: HTTPFields = [:],
		body: @escaping () throws -> RequestBody? = { nil },
		transform: (@Sendable (Data, HTTPURLResponse) throws -> Response)? = nil
	) {
		self.method = httpMethod
		self.path = "\(name)/\(method)"
		self.headers = headers
		self.body = body
		self.prepare = { $0 }
		self.transform = transform
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

extension QBittorrentRequest {
	private static func handleTransform(
		_ data: Data,
		response: HTTPURLResponse,
		injected: ((Data, HTTPURLResponse) throws -> Response)?
	) throws -> Response {
		do {
			if let injected {
				let transformed = try injected(data, response)
				return transformed
			}

			let response = try JSONDecoder().decode(Response.self, from: data)

			return response
		} catch let error as QBittorrent.Error {
			throw error
		} catch {
			throw QBittorrent.Error.decoding(error)
		}
	}
}
