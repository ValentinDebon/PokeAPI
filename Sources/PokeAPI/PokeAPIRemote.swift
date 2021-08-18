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

	private func resourceListURL<R>(at location: String?, for resourceType: R.Type) async throws -> URL where R : Resource {
		let url : URL

		if let location = location {
			url = URL(string: location)!
		} else {
			url = try await URL(string: self.endpoints()[R.endpoint]!)!
		}

		return url
	}

	public func endpoints() async throws -> [String : String] {
		try await self.decoder.decode([String : String].self, from: self.session.data(from: self.url.appendingPathComponent(self.endpoints)).0)
	}

	public func resourceList<R>(at location: String?) async throws -> APIResourceList<R> where R : Resource {
		try await self.decoder.decode(APIResourceList<R>.self, from: self.session.data(from: self.resourceListURL(at: location, for: R.self)).0)
	}

	public func namedResourceList<R>(at location: String?) async throws -> NamedAPIResourceList<R> where R : NamedResource {
		try await self.decoder.decode(NamedAPIResourceList<R>.self, from: self.session.data(from: self.resourceListURL(at: location, for: R.self)).0)
	}

	public func resource<R>(at location: String) async throws -> R where R : Resource {
		try await self.decoder.decode(R.self, from: self.session.data(from: URL(string: location)!).0)
	}

	public func locationAreaEncounters(pokemon: Pokemon) async throws -> Set<LocationAreaEncounter> {
		try await self.decoder.decode(Set<LocationAreaEncounter>.self, from: self.session.data(from: URL(string: pokemon.locationAreaEncounters)!).0)
	}
}

