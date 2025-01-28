@_exported import APIClient
import Foundation
import Logging

#if canImport(Combine)
import Combine
#endif

// URLSession in exists in FoundationNetworking on Linux
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

/// Convenience typealias for the QBittorrent client.
public typealias QBittorrentClient = Client<QBittorrentResponseError>

/// A QBittorrent JSON-RPC API client.
public final class QBittorrent: Sendable {
	/// The URL of the QBittorrent server.
	public let baseURL: URL
	/// The username used for authentication
	public let username: String
	/// The password used for authentication.
	public let password: String
	/// Basic authentication to be added to Authorization header.
	// TODO: Add BA support to APIClient...
	public let basicAuthentication: BasicAuthentication?

	private let logger: Logger

	/// The underlying API Client.
	private let client: QBittorrentClient

	/// Creates a QBittorrent client to interact with the given server URL.
	/// - Parameters:
	///   - baseURL: The URL of the QBittorrent server.
	///   - password: The password used for authentication.
	public init(baseURL: URL, username: String, password: String, basicAuthentication: BasicAuthentication? = nil) {
		LoggingSystem.bootstrap { identifier in
			var logger = StreamLogHandler.standardOutput(label: identifier)
#if DEBUG
			logger.logLevel = .debug
#else
			logger.logLevel = .info
#endif
			return logger
		}

		logger = Logger(label: "QBittorrent")

		self.baseURL = baseURL
		self.username = username
		self.password = password
		self.basicAuthentication = basicAuthentication

		var headers = HTTPFields()
		if let basicAuthentication {
			headers["Authorization"] = basicAuthentication.encoded
		}

		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase

		client = .init(
			baseURL: self.baseURL
				.appendingPathComponent("api")
				.appendingPathComponent("v2"),
			defaultHeaders: headers,
			decoder: decoder,
			validate: Self.validate
		)
	}

	@Sendable
	private static func validate(data: Data, response: HTTPURLResponse) throws(QBittorrentClient.Error) {
		switch response.statusCode {
		case 200:
			// In some cases... QBittorent will use the word 'Fails.' as an indication of an error (yup.. super helpful...)
			if String(decoding: data, as: UTF8.self) == "Fails." {
				throw .response(.fails)
			}
		case 403:
			throw .response(.unauthenticated)
		case 409:
			// TODO: sometimes data will have a message - use message() and pass the message..
			throw .response(.conflict)
		default:
			fatalError("Unhandled status code: \(response.statusCode)")
		}
	}
}

#if canImport(Combine)
/// Combine-powered extensions for `Deluge`.
public extension QBittorrent {
	/// Sends a request to the server.
	/// - Parameter request: The request to be sent to the server.
	/// - Returns: A publisher that emits a value when the request completes.
	func request<Value>(_ request: QBittorrentRequest<Value>) -> AnyPublisher<Value, QBittorrentClient.Error> {
		let retryIfNeeded = { (error: QBittorrentClient.Error) -> AnyPublisher<Value, QBittorrentClient.Error> in
			guard case .response(.unauthenticated) = error else {
				return Fail(error: error)
					.eraseToAnyPublisher()
			}

			return self.request(.authenticate(username: self.username, password: self.password))
				.flatMap { authenticated in
					guard authenticated else {
						return Fail<Value, QBittorrentClient.Error>(error: QBittorrentClient.Error.response(.unauthenticated))
							.eraseToAnyPublisher()
					}

					return self.client.request(request)
				}
				.eraseToAnyPublisher()
		}

		return client.request(request)
			.catch(retryIfNeeded)
			.eraseToAnyPublisher()
	}
}
#endif

/// Swift Concurrency powered extensions for `Deluge`.
public extension QBittorrent {
	/// Sends a request to the server.
	/// - Parameter request: The request to be sent to the server.
	/// - Returns: A publisher that emits a value when the request completes.
	@discardableResult
	func request<Value>(_ request: QBittorrentRequest<Value>) async throws(QBittorrentClient.Error) -> Value {
		do {
			return try await client.request(request)
		} catch {
			guard case .response(.unauthenticated) = error else {
				throw error
			}

			let authenticated = try await client.request(QBittorrentRequest<Bool>.authenticate(username: username, password: password))
			if !authenticated {
				throw .response(.unauthenticated)
			}
			return try await client.request(request)
		}
	}
}

public extension QBittorrent {
	struct BasicAuthentication: Equatable, Codable, Sendable {
		public let username: String
		public let password: String

		public init(username: String, password: String) {
			self.username = username
			self.password = password
		}

		var encoded: String {
			Data("\(username):\(password)".utf8).base64EncodedString()
		}
	}
}
