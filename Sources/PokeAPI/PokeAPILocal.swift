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

	public func endpoints() async throws -> [String : String] {
		try self.decoder.decode([String : String].self, from: Data(contentsOf: self.url.appendingPathComponent(self.endpoints).appendingPathComponent(Self.indexFile)))
	}

	public func resourceList<R>() async throws -> APIResourceList<R> where R : Resource {
		try await self.decoder.decode(APIResourceList<R>.self, from: Data(contentsOf: self.url.appendingPathComponent(self.endpoints()[R.endpoint]!).appendingPathComponent(Self.indexFile)))
	}

	public func namedResourceList<R>() async throws -> NamedAPIResourceList<R> where R : NamedResource {
		try await self.decoder.decode(NamedAPIResourceList<R>.self, from: Data(contentsOf: self.url.appendingPathComponent(self.endpoints()[R.endpoint]!).appendingPathComponent(Self.indexFile)))
	}

	public func resource<R>(at location: String) async throws -> R where R : Resource {
		try self.decoder.decode(R.self, from: Data(contentsOf: self.url.appendingPathComponent(location).appendingPathComponent(Self.indexFile)))
	}

	public func locationAreaEncounters(pokemon: Pokemon) async throws -> Set<LocationAreaEncounter> {
		try self.decoder.decode(Set<LocationAreaEncounter>.self, from: Data(contentsOf: self.url.appendingPathComponent(pokemon.locationAreaEncounters).appendingPathComponent(Self.indexFile)))
	}
}
