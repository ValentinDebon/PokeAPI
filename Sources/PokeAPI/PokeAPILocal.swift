import Foundation

public struct PokeAPILocal: PokeAPI {
	public static let indexFile = "index.json"

	private let decoder: JSONDecoder
	private let url: URL

	public init(at url: URL) {
		self.decoder = JSONDecoder()
		self.url = url
	}

	public func endpoints(_ completion: (Result<[String : String], Error>) -> Void) {
		completion(Result {
			try self.decoder.decode([String : String].self,
				from: Data(contentsOf: self.url.appendingPathComponent("api/v2").appendingPathComponent(Self.indexFile)))
		})
	}

	public func resourceList<R>(_ completion: (Result<APIResourceList<R>, Error>) -> Void) where R : Resource {
		self.endpoints { endpointsResult in
			completion(Result {
				try self.decoder.decode(APIResourceList<R>.self,
					from: Data(contentsOf: self.url.appendingPathComponent(endpointsResult.get()[R.endpoint]!).appendingPathComponent(Self.indexFile)))
			})
		}
	}

	public func namedResourceList<R>(_ completion: (Result<NamedAPIResourceList<R>, Error>) -> Void) where R : NamedResource {
		self.endpoints { endpointsResult in
			completion(Result {
				try self.decoder.decode(NamedAPIResourceList<R>.self,
					from: Data(contentsOf: self.url.appendingPathComponent(endpointsResult.get()[R.endpoint]!).appendingPathComponent(Self.indexFile)))
			})
		}
	}

	public func resource<R>(atLocation location: String, _ completion: (Result<R, Error>) -> Void) where R : Resource {
		completion(Result {
			try self.decoder.decode(R.self,
				from: Data(contentsOf: self.url.appendingPathComponent(location).appendingPathComponent(Self.indexFile)))
		})
	}

	public func locationAreaEncounters(pokemon: Pokemon, _ completion: (Result<Set<LocationAreaEncounter>, Error>) -> Void) {
		completion(Result {
			try self.decoder.decode(Set<LocationAreaEncounter>.self,
				from: Data(contentsOf: self.url.appendingPathComponent(pokemon.locationAreaEncounters).appendingPathComponent(Self.indexFile)))
		})
	}
}

