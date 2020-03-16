import Foundation

public final class PokeAPILocal: PokeAPI {
	public static let indexFile = "index.json"

	private let url: URL
	private let decoder: JSONDecoder
	private let endpoints: [String: String]

	public init(at url: URL, index: String = "api/v2") throws {
		self.url = url
		self.decoder = JSONDecoder()
		self.endpoints = try self.decoder.decode([String: String].self, from: Data(contentsOf: url.appendingPathComponent(index).appendingPathComponent(PokeAPILocal.indexFile)))
	}

	public func location(endpoint: String, id: String? = nil) -> String? {
		guard let endpoint = self.endpoints[endpoint] else {
			return nil
		}

		if let id = id {
			return endpoint + id
		} else {
			return endpoint
		}
	}

	public func resource<R>(at location: String) -> R? where R: Resource {
		try? self.decoder.decode(R.self, from: Data(contentsOf: self.url.appendingPathComponent(location).appendingPathComponent(PokeAPILocal.indexFile)))
	}

	public func locationAreaEncounters(pokemon: Pokemon) -> Set<LocationAreaEncounter>? {
		try? self.decoder.decode(Set<LocationAreaEncounter>.self, from: Data(contentsOf: self.url.appendingPathComponent(pokemon.locationAreaEncounters).appendingPathComponent(PokeAPILocal.indexFile)))
	}

	public func resourceList<R>() -> APIResourceList<R>? where R: Resource {
		guard let endpoint = self.endpoints[R.endpoint] else {
			return nil
		}

		return try? self.decoder.decode(APIResourceList<R>.self, from: Data(contentsOf: self.url.appendingPathComponent(endpoint).appendingPathComponent(PokeAPILocal.indexFile)))
	}

	public func namedResourceList<R>() -> NamedAPIResourceList<R>? where R: NamedResource {
		guard let endpoint = self.endpoints[R.endpoint] else {
			return nil
		}

		return try? self.decoder.decode(NamedAPIResourceList<R>.self, from: Data(contentsOf: self.url.appendingPathComponent(endpoint).appendingPathComponent(PokeAPILocal.indexFile)))
	}
}

