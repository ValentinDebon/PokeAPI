import Foundation

public final class PokeAPIRemote : PokeAPIProtocol {
	public static func makeURL() -> URL? {
		try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
	}

	public static func makeCache(at url: URL? = PokeAPIRemote.makeURL()) -> URLCache {
		URLCache(memoryCapacity: 50 * 1_048_576, diskCapacity: 150 * 1_048_576, directory: url)
	}

	public static func makeSession(withIdentifier identifier: String = "PokeAPI",
								   cachedWith urlCache: URLCache? = PokeAPIRemote.makeCache()) -> URLSession {
		let sessionConfiguration = URLSessionConfiguration.background(withIdentifier: identifier)
		sessionConfiguration.networkServiceType = .responsiveData
		sessionConfiguration.urlCache = urlCache
		sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad

		return URLSession(configuration: sessionConfiguration)
	}

	public let url : URL
	public let session : URLSession
	public var delegate : PokeAPIDelegate?

	public init(at url: URL, session: URLSession = PokeAPIRemote.makeSession(), delegate: PokeAPIDelegate?) {
		self.url = url
		self.session = session
		self.delegate = delegate
	}

	public func location(endpoint: String, id: String) -> String {
		fatalError("unimplemented")
	}

	public func resource<R>(at location: String) -> R? where R : Resource {
		fatalError("unimplemented")
	}
}
