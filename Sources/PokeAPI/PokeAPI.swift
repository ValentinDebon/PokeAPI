
public protocol PokeAPI {
	func endpoints() async throws -> [String : String]
	func resourceList<R>(at location: String?) async throws -> APIResourceList<R> where R : Resource
	func namedResourceList<R>(at location: String?) async throws -> NamedAPIResourceList<R> where R : NamedResource
	func resource<R>(at location: String) async throws -> R where R : Resource
	func locationAreaEncounters(pokemon: Pokemon) async throws -> Set<LocationAreaEncounter>
}

public extension PokeAPI {
	@inlinable func resourceList<R>() async throws -> APIResourceList<R> where R : Resource {
		try await self.resourceList(at: nil)
	}

	@inlinable func namedResourceList<R>() async throws -> NamedAPIResourceList<R> where R : NamedResource {
		try await self.namedResourceList(at: nil)
	}
}
