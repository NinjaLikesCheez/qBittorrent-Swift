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

/// A QBittorrent JSON-RPC API client.
public final class QBittorrent: Client, Sendable {
	public typealias ResponseError = QBittorrentResponseError
	public typealias Error = ClientError<ResponseError>

	/// The URL of the QBittorrent server.
	public let baseURL: URL
	/// The username used for authentication
	public let username: String
	/// The password used for authentication.
	public let password: String
	/// Basic authentication to be added to Authorization header.
	// TODO: Add BA support to APIClient...
	public let basicAuthentication: BasicAuthentication?

	public let defaultHeaders: HTTPFields?

	public let decoder: JSONDecoder

	public let validate: @Sendable (Data, HTTPURLResponse) throws(APIClient.ClientError<QBittorrentResponseError>) -> Void

	public let prepare: @Sendable (URLRequest) -> URLRequest

	public let session: URLSession = .shared

	private let logger = Logger(label: "QBittorrent")

	/// Creates a QBittorrent client to interact with the given server URL.
	/// - Parameters:
	///   - baseURL: The URL of the QBittorrent server.
	///   - password: The password used for authentication.
	public init(baseURL: URL, username: String, password: String, basicAuthentication: BasicAuthentication? = nil) {
		self.baseURL = baseURL.appending(path: "api").appending(path: "v2")
		self.username = username
		self.password = password
		self.basicAuthentication = basicAuthentication

		var headers = HTTPFields()
		if let basicAuthentication {
			headers["Authorization"] = basicAuthentication.encoded
		}
		self.defaultHeaders = headers

		decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase

		prepare = { $0 }
		validate = Self.validate
	}

	@Sendable
	private static func validate(data: Data, response: HTTPURLResponse) throws(QBittorrent.Error) {
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
	func request<Value>(_ request: QBittorrentRequest<Value>) -> AnyPublisher<Value, QBittorrent.Error> {
		let retryIfNeeded = { (error: QBittorrent.Error) -> AnyPublisher<Value, QBittorrent.Error> in
			guard case .response(.unauthenticated) = error else {
				self.logger.error("Skipping retry for error: \(error)")
				return Fail(error: error)
					.eraseToAnyPublisher()
			}

			self.logger.debug("Retrying authentication")

			return self.send(request: QBittorrentRequest<Bool>.authenticate(username: self.username, password: self.password))
				.flatMap { authenticated in
					guard authenticated else {
						self.logger.error("Failed to authenticate")
						return Fail<Value, QBittorrent.Error>(error: QBittorrent.Error.response(.unauthenticated))
							.eraseToAnyPublisher()
					}

					return self.request(request)
				}
				.eraseToAnyPublisher()
		}

		return send(request: request)
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
	func request<Value>(_ request: QBittorrentRequest<Value>) async throws(QBittorrent.Error) -> Value {
		do {
			return try await send(request: request)
		} catch {
			guard case .response(.unauthenticated) = error else {
				throw error
			}

			logger.debug("Retrying authentication")

			let authenticated = try await send(
				request: QBittorrentRequest<Bool>.authenticate(username: username, password: password)
			)

			if !authenticated {
				logger.critical("Failed to authenticate")
				throw .response(.unauthenticated)
			}
			return try await send(request: request)
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
