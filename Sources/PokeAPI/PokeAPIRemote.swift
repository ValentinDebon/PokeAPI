import Foundation

public protocol PokeAPIDelegate: AnyObject {
	func updatedEndpoints(pokeAPI: PokeAPI, endpoints: [String: String])
	func updatedResourceList<R>(pokeAPI: PokeAPI, resourceList: APIResourceList<R>) where R: Resource
	func updatedNamedResourceList<R>(pokeAPI: PokeAPI, namedResourceList: NamedAPIResourceList<R>) where R : NamedResource
	func updatedResource<R>(pokeAPI: PokeAPI, resource: R) where R : Resource
	func updatedLocationAreaEncounters(pokeAPI: PokeAPI, encounters: Set<LocationAreaEncounter>)
}

public final class PokeAPIRemote: PokeAPI {
	public static func makeURL() -> URL? {
		try? FileManager.default.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
	}

	public static func makeCache(at url: URL? = PokeAPIRemote.makeURL()) -> URLCache {
		URLCache(memoryCapacity: 50 * 1_048_576, diskCapacity: 150 * 1_048_576, diskPath: url?.path)
	}

	public static func makeSession(withIdentifier identifier: String = "PokeAPI",
								   cachedWith urlCache: URLCache? = PokeAPIRemote.makeCache()) -> URLSession {
		let sessionConfiguration = URLSessionConfiguration.background(withIdentifier: identifier)
		sessionConfiguration.networkServiceType = .responsiveData
		sessionConfiguration.urlCache = urlCache
		sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad

		return URLSession(configuration: sessionConfiguration)
	}

	private let baseURL: URL
	private let session: URLSession
	private let decoder: JSONDecoder
	public var delegate: PokeAPIDelegate?

	public init(at url: URL, index: String = "api/v2", session: URLSession = PokeAPIRemote.makeSession(), delegate: PokeAPIDelegate?) {
		self.baseURL = url.appendingPathExtension(index)
		self.session = session
		self.decoder = JSONDecoder()
		self.delegate = delegate
	}

	public func location(endpoint: String, id: String? = nil) -> String? {
		var location = self.baseURL.appendingPathComponent(endpoint)

		if let id = id {
			location.appendPathComponent(id)
		}

		return location.description
	}

	public func resource<R>(at location: String) -> R? where R: Resource {
		if let locationURL = URL(string: location, relativeTo: self.baseURL) {
			self.session.dataTask(with: locationURL) { data, response, error in
				if let data = data, let resource : R = try? self.decoder.decode(R.self, from: data) {
					self.delegate?.updatedResource(pokeAPI: self, resource: resource)
				}
			}
		}

		return nil
	}
	
	public func locationAreaEncounters(pokemon: Pokemon) -> Set<LocationAreaEncounter>? {
		let locationURL = self.baseURL
			.appendingPathComponent(Pokemon.endpoint)
			.appendingPathComponent(String(pokemon.id))
			.appendingPathComponent("encounters")

		self.session.dataTask(with: locationURL) { data, response, error in
			if let data = data, let encounters = try? self.decoder.decode(Set<LocationAreaEncounter>.self, from: data) {
				self.delegate?.updatedLocationAreaEncounters(pokeAPI: self, encounters: encounters)
			}
		}

		return nil
	}

	public func resourceList<R>() -> APIResourceList<R>? where R: Resource {
		if let locationURL = URL(string: R.endpoint, relativeTo: self.baseURL) {
			self.session.dataTask(with: locationURL) { data, response, error in
				if let data = data, let resourceList = try? self.decoder.decode(APIResourceList<R>.self, from: data) {
					self.delegate?.updatedResourceList(pokeAPI: self, resourceList: resourceList)
				}
			}
		}

		return nil
		
	}

	public func namedResourceList<R>() -> NamedAPIResourceList<R>? where R: NamedResource {
		if let locationURL = URL(string: R.endpoint, relativeTo: self.baseURL) {
			self.session.dataTask(with: locationURL) { data, response, error in
				if let data = data, let namedResourceList = try? self.decoder.decode(NamedAPIResourceList<R>.self, from: data) {
					self.delegate?.updatedNamedResourceList(pokeAPI: self, namedResourceList: namedResourceList)
				}
			}
		}

		return nil
	}
}

