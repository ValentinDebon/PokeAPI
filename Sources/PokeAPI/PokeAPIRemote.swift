import Foundation

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

public struct PokeAPIRemote : PokeAPI {
	#if os(Linux)
	public static func makeURL() -> URL? {
		nil
	}

	public static func makeCache(at url: URL? = PokeAPIRemote.makeURL()) -> URLCache {
		URLCache()
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

	private func completeResourceList<R>(at url: URL, _ completion: @escaping (Result<APIResourceList<R>, Error>) -> Void) where R : Resource {
		self.session.dataTask(with: url) { data, urlResponse, error in
			completion(Result {
				if let error = error {
					throw error
				}

				let resourceList = try self.decoder.decode(APIResourceList<R>.self, from: data ?? Data())
				
				if let next = resourceList.next {
					self.completeResourceList(at: URL(string: next)!, completion)
				}

				return resourceList
			})
		}.resume()
	}

	private func completeNamedResourceList<R>(at url: URL, _ completion: @escaping (Result<NamedAPIResourceList<R>, Error>) -> Void) where R : NamedResource {
		self.session.dataTask(with: url) { data, urlResponse, error in
			completion(Result {
				if let error = error {
					throw error
				}

				let namedResourceList = try self.decoder.decode(NamedAPIResourceList<R>.self, from: data ?? Data())
				
				if let next = namedResourceList.next {
					self.completeNamedResourceList(at: URL(string: next)!, completion)
				}

				return namedResourceList
			})
		}.resume()
	}

	public func endpoints(_ completion: @escaping (Result<[String : String], Error>) -> Void) {
		self.session.dataTask(with: self.url.appendingPathComponent(self.endpoints)) { data, urlResponse, error in
			completion(Result {
				if let error = error {
					throw error
				}

				return try self.decoder.decode([String : String].self, from: data ?? Data())
			})
		}.resume()
	}

	public func resourceList<R>(_ completion: @escaping (Result<APIResourceList<R>, Error>) -> Void) where R : Resource {
		self.endpoints {
			switch $0 {
			case .success(let endpoints):
				self.completeResourceList(at: URL(string: endpoints[R.endpoint]!)!, completion)
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}

	public func namedResourceList<R>(_ completion: @escaping (Result<NamedAPIResourceList<R>, Error>) -> Void) where R : NamedResource {
		self.endpoints {
			switch $0 {
			case .success(let endpoints):
				self.completeNamedResourceList(at: URL(string: endpoints[R.endpoint]!)!, completion)
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}

	public func resource<R>(atLocation location: String, _ completion: @escaping (Result<R, Error>) -> Void) where R : Resource {
		self.session.dataTask(with: URL(string: location)!) { data, urlResponse, error in
			completion(Result {
				if let error = error {
					throw error
				}

				return try self.decoder.decode(R.self, from: data ?? Data())
			})
		}.resume()
	}

	public func locationAreaEncounters(pokemon: Pokemon, _ completion: @escaping (Result<Set<LocationAreaEncounter>, Error>) -> Void) {
		self.session.dataTask(with: URL(string: pokemon.locationAreaEncounters)!) { data, urlResponse, error in
			completion(Result {
				if let error = error {
					throw error
				}

				return try self.decoder.decode(Set<LocationAreaEncounter>.self, from: data ?? Data())
			})
		}.resume()
	}
}

