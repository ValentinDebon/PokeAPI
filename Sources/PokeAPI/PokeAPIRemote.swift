import Foundation
import FoundationNetworking

public struct PokeAPIRemote : PokeAPI {
	public typealias Failure = Error

	public static func makeURL() -> URL? {
		try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
	}

	public static func makeCache(at url: URL? = PokeAPIRemote.makeURL()) -> URLCache {
		URLCache(memoryCapacity: 50 * 1_048_576, diskCapacity: 150 * 1_048_576, diskPath: url?.path)
	}

	public static func makeSession(withIdentifier identifier: String = "PokeAPI",
								   cachedWith urlCache: URLCache? = PokeAPIRemote.makeCache()) -> URLSession {
		#if os(Linux)
		let sessionConfiguration = URLSessionConfiguration.default
		#else // The following are unavailable outside of Darwin platforms
		let sessionConfiguration = URLSessionConfiguration.background(withIdentifier: identifier)
		sessionConfiguration.networkServiceType = .responsiveData
		sessionConfiguration.urlCache = urlCache
		sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad
		#endif

		return URLSession(configuration: sessionConfiguration)
	}

	private let session: URLSession
	private let decoder: JSONDecoder
	private let url: URL

	public init(at url: URL, session: URLSession = PokeAPIRemote.makeSession()) {
		self.session = session
		self.decoder = JSONDecoder()
		self.url = url
	}

	public func endpoints(_ completion: (Result<[String : String], Failure>) -> Void) {
		fatalError("unimplemented")
	}

	public func resourceList<R>(_ completion: (Result<APIResourceList<R>, Failure>) -> Void) where R : Resource {
		fatalError("unimplemented")
	}

	public func namedResourceList<R>(_ completion: (Result<NamedAPIResourceList<R>, Failure>) -> Void) where R : NamedResource {
		fatalError("unimplemented")
	}

	public func resource<R>(atLocation location: String, _ completion: (Result<R, Failure>) -> Void) where R : Resource {
		fatalError("unimplemented")
	}

	public func locationAreaEncounters(pokemon: Pokemon, _ completion: (Result<Set<LocationAreaEncounter>, Failure>) -> Void) {
		fatalError("unimplemented")
	}
}

