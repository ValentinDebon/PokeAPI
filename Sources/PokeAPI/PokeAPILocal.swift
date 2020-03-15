import Foundation

public final class PokeAPILocal: PokeAPIProtocol {
	private let url: URL
	private let decoder: JSONDecoder
	private let endpoints: [String: String]

	public init(at url: URL, index: String = "/api/v2/index.json") throws {
		self.url = url
		self.decoder = JSONDecoder()
		self.endpoints = try self.decoder.decode([String: String].self, from: Data(contentsOf: url.appendingPathComponent(index)))
	}

	public func location(endpoint: String, id: String? = nil) -> String? {
		guard let endpoint = self.endpoints[endpoint] else {
			return nil
		}

		return endpoint + (id ?? "/index.json")
	}

	public func resource<R>(at location: String) -> R? where R: Resource {
		try? self.decoder.decode(R.self, from: Data(contentsOf: self.url.appendingPathComponent(location).appendingPathComponent("index.json")))
	}

	public func locationAreaEncounters(pokemon: Pokemon) -> Set<LocationAreaEncounter>? {
		try? self.decoder.decode(Set<LocationAreaEncounter>.self, from: Data(contentsOf: self.url.appendingPathComponent(pokemon.locationAreaEncounters).appendingPathComponent("/index.json")))
	}

	public func resourceList<R>() -> APIResourceList<R>? where R: Resource {
		guard let endpoint = self.endpoints[R.endpoint] else {
			return nil
		}

		return try? self.decoder.decode(APIResourceList<R>.self, from: Data(contentsOf: self.url.appendingPathComponent(endpoint).appendingPathComponent("/index.json")))
	}

	public func namedResourceList<R>() -> NamedAPIResourceList<R>? where R: NamedResource {
		guard let endpoint = self.endpoints[R.endpoint] else {
			return nil
		}

		return try? self.decoder.decode(NamedAPIResourceList<R>.self, from: Data(contentsOf: self.url.appendingPathComponent(endpoint).appendingPathComponent("/index.json")))
	}
}

