import Foundation

public protocol PokeAPIDelegate : AnyObject {
	func updatedEndpoints(pokeAPI: PokeAPIProtocol, withEndpoints: [String : String])
	func updatedResourceList(pokeAPI: PokeAPIProtocol, endpoint: String, withCount: Int, results: Set<String>)
	func updatedNamedResourceList(pokeAPI: PokeAPIProtocol, endpoint: String, withCount: Int, results: [String : String])
	func updatedResource(pokeAPI: PokeAPIProtocol, at location: String)
}

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

	public var delegate : PokeAPIDelegate?

	public init(at url: URL, session: URLSession = PokeAPIRemote.makeSession(), delegate: PokeAPIDelegate?) {
		self.delegate = delegate
	}

	public func location(endpoint: String, id: String? = nil) -> String? {
		fatalError("unimplemented")
	}

	public func resource<R>(at location: String) -> R? where R : Resource {
		fatalError("unimplemented")
	}
	
	public func locationAreaEncounters(pokemon: Pokemon) -> Set<LocationAreaEncounter>? {
		fatalError("unimplemented")
	}

	public func resourceList<R>() -> APIResourceList<R>? where R : Resource {
		fatalError("unimplemented")
		
	}

	public func namedResourceList<R>() -> NamedAPIResourceList<R>? where R : NamedResource {
		fatalError("unimplemented")
	}
}

