
public protocol PokeAPI {
	func endpoints(_ completion: (Result<[String : String], Error>) -> Void)
	func resourceList<R>(_ completion: (Result<APIResourceList<R>, Error>) -> Void) where R : Resource
	func namedResourceList<R>(_ completion: (Result<NamedAPIResourceList<R>, Error>) -> Void) where R : NamedResource
	func resource<R>(atLocation location: String, _ completion: (Result<R, Error>) -> Void) where R : Resource
	func locationAreaEncounters(pokemon: Pokemon, _ completion: (Result<Set<LocationAreaEncounter>, Error>) -> Void)
}

