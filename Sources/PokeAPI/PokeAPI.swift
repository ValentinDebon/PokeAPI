
public protocol PokeAPI {
	func endpoints() async throws -> [String : String]
	func resourceList<R>() async throws -> APIResourceList<R> where R : Resource
	func namedResourceList<R>() async throws -> NamedAPIResourceList<R> where R : NamedResource
	func resource<R>(at location: String) async throws -> R where R : Resource
	func locationAreaEncounters(pokemon: Pokemon) async throws -> Set<LocationAreaEncounter>
}
