import Foundation

/// Errors that can occur during QBittorrent operations.
public enum QBittorrentError: Error {
    /// An error occurred while encoding the request.
    case encoding(Error)
    /// An error occurred while decoding the response.
    case decoding(Error)
    /// An error occurred during the network request.
    case request(QBittorrentRequestError)
    /// The server returned an unexpected response.
    case unexpectedResponse
    /// An error returned by the server.
    case serverError(QBittorrentResponseError)
}

/// An error that occurred during a network request.
public enum QBittorrentRequestError: Error, Sendable {
    /// A typed `URLError`.
    case urlError(URLError)
    // Needed because `URLSession.data(for:)` throws `any Error`, sigh...
    /// An untyped `Error`.
    case unknown(Error)
}

/// An error returned by the server.
public enum QBittorrentResponseError: Error, Sendable {
    /// An error containing a message.
    case message(String?)
    /// The provided authentication was not valid.
    case unauthenticated
    /// The added torrent is already in the session.
    case torrentAlreadyInSession
    /// Until everything uses typed throws... this has to be here
    /// An untyped `Error`
    case unknown(Error)
	case conflict
	case fails
}

/// Error codes returned by the Deluge JSON-RPC API.
///
/// See [deluge/ui/web/json_api.py](https://github.com/deluge-torrent/deluge/blob/develop/deluge/ui/web/json_api.py)
private enum QBittorrentErrorCode: Int {
    /// The provided authentication was not valid.
    case unauthenticated = 1
    /// The requested RPC method does not exist.
    case unknownRpcMethod = 2
    /// A synchronous RPC method returned an error.
    case rpcRequestErrorSync = 3
    /// An asynchronous RPC method returned an error.
    ///
    /// This variant is for RPC methods that use `twisted.internet.defer.Deferred`.
    case rpcRequestErrorAsync = 4
    /// The JSON request could not be processed.
    case jsonRequestError = 5
}
