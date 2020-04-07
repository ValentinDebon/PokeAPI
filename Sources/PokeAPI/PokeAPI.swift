
public protocol PokeAPI {
	associatedtype Failure : Error

	func endpoints(_ completion: (Result<[String : String], Failure>) -> Void)
	func resourceList<R>(_ completion: (Result<APIResourceList<R>, Failure>) -> Void) where R : Resource
	func namedResourceList<R>(_ completion: (Result<NamedAPIResourceList<R>, Failure>) -> Void) where R : NamedResource
	func resource<R>(atLocation location: String, _ completion: (Result<R, Failure>) -> Void) where R : Resource
	func locationAreaEncounters(pokemon: Pokemon, _ completion: (Result<Set<LocationAreaEncounter>, Failure>) -> Void)
}

