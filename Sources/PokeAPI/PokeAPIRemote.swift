import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct PokeAPIRemote : PokeAPI {
	#if os(Linux)
	public static func makeURL() -> URL? {
		guard let userCache = getenv("XDG_CACHE_HOME"), strlen(userCache) != 0 else {
			guard let home = getenv("HOME"), strlen(home) != 0 else {
				return nil
			}

			return URL(fileURLWithPath: "\(home)/.cache")
		}

		return URL(fileURLWithPath: String(cString: userCache))
	}

	public static func makeCache(at url: URL? = PokeAPIRemote.makeURL()) -> URLCache {
		URLCache(memoryCapacity: 50 * 1_048_576, diskCapacity: 150 * 1_048_576, diskPath: url?.path)
	}

	public static func makeSession(withIdentifier identifier: String = "PokeAPI",
								   cachedWith urlCache: URLCache? = PokeAPIRemote.makeCache()) -> URLSession {
		URLSession(configuration: URLSessionConfiguration.default)
	}
	#else
	public static func makeURL() -> URL? {
		try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
	}

	public static func makeCache(at url: URL? = PokeAPIRemote.makeURL()) -> URLCache {
		if #available(iOS 13.0, *) {
			return URLCache(memoryCapacity: 50 * 1_048_576, diskCapacity: 150 * 1_048_576, directory: url)
		} else {
			return URLCache()
		}
	}

	public static func makeSession(withIdentifier identifier: String = "PokeAPI",
								   cachedWith urlCache: URLCache? = PokeAPIRemote.makeCache()) -> URLSession {
		let sessionConfiguration = URLSessionConfiguration.background(withIdentifier: identifier)
		sessionConfiguration.networkServiceType = .responsiveData
		sessionConfiguration.urlCache = urlCache
		sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad

		return URLSession(configuration: sessionConfiguration)
	}
	#endif

	private let session: URLSession
	private let decoder: JSONDecoder
	private let endpoints: String
	private let url: URL

	public init(at url: URL, endpoints: String = "api/v2", session: URLSession = PokeAPIRemote.makeSession()) {
		self.session = session
		self.decoder = JSONDecoder()
		self.endpoints = endpoints
		self.url = url
	}

	public func endpoints() async throws -> [String : String] {
		try await self.decoder.decode([String : String].self, from: self.session.data(from: self.url.appendingPathComponent(self.endpoints)).0)
	}

	public func resourceList<R>() async throws -> APIResourceList<R> where R : Resource {
		try await self.decoder.decode(APIResourceList<R>.self, from: self.session.data(from: self.url.appendingPathComponent(self.endpoints()[R.endpoint]!)).0)
	}

	public func namedResourceList<R>() async throws -> NamedAPIResourceList<R> where R : NamedResource {
		try await self.decoder.decode(NamedAPIResourceList<R>.self, from: self.session.data(from: self.url.appendingPathComponent(self.endpoints()[R.endpoint]!)).0)
	}

	public func resource<R>(at location: String) async throws -> R where R : Resource {
		try await self.decoder.decode(R.self, from: self.session.data(from: self.url.appendingPathComponent(location)).0)
	}

	public func locationAreaEncounters(pokemon: Pokemon) async throws -> Set<LocationAreaEncounter> {
		try await self.decoder.decode(Set<LocationAreaEncounter>.self, from: self.session.data(from: self.url.appendingPathComponent(pokemon.locationAreaEncounters)).0)
	}
}

