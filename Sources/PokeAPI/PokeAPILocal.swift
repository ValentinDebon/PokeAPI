import Foundation

public struct PokeAPILocal: PokeAPI {
	public static let indexFile = "index.json"

	private let decoder: JSONDecoder
	private let endpoints: String
	private let url: URL

	public init(at url: URL, endpoints: String = "api/v2") {
		self.decoder = JSONDecoder()
		self.endpoints = endpoints
		self.url = url
	}

	public func endpoints(_ completion: @escaping (Result<[String : String], Error>) -> Void) {
		completion(Result {
			try self.decoder.decode([String : String].self,
									from: Data(contentsOf: self.url.appendingPathComponent(self.endpoints).appendingPathComponent(Self.indexFile)))
		})
	}

	public func resourceList<R>(_ completion: @escaping (Result<APIResourceList<R>, Error>) -> Void) where R : Resource {
		self.endpoints { endpointsResult in
			completion(Result {
				try self.decoder.decode(APIResourceList<R>.self,
					from: Data(contentsOf: self.url.appendingPathComponent(endpointsResult.get()[R.endpoint]!).appendingPathComponent(Self.indexFile)))
			})
		}
	}

	public func namedResourceList<R>(_ completion: @escaping (Result<NamedAPIResourceList<R>, Error>) -> Void) where R : NamedResource {
		self.endpoints { endpointsResult in
			completion(Result {
				try self.decoder.decode(NamedAPIResourceList<R>.self,
					from: Data(contentsOf: self.url.appendingPathComponent(endpointsResult.get()[R.endpoint]!).appendingPathComponent(Self.indexFile)))
			})
		}
	}

	public func resource<R>(atLocation location: String, _ completion: @escaping (Result<R, Error>) -> Void) where R : Resource {
		completion(Result {
			try self.decoder.decode(R.self,
				from: Data(contentsOf: self.url.appendingPathComponent(location).appendingPathComponent(Self.indexFile)))
		})
	}

	public func locationAreaEncounters(pokemon: Pokemon, _ completion: @escaping (Result<Set<LocationAreaEncounter>, Error>) -> Void) {
		completion(Result {
			try self.decoder.decode(Set<LocationAreaEncounter>.self,
				from: Data(contentsOf: self.url.appendingPathComponent(pokemon.locationAreaEncounters).appendingPathComponent(Self.indexFile)))
		})
	}
}

