
public protocol PokeAPI {
	func endpoints(_ completion: @escaping (Result<[String : String], Error>) -> Void)
	func resourceList<R>(_ completion: @escaping (Result<APIResourceList<R>, Error>) -> Void) where R : Resource
	func namedResourceList<R>(_ completion: @escaping (Result<NamedAPIResourceList<R>, Error>) -> Void) where R : NamedResource
	func resource<R>(atLocation location: String, _ completion: @escaping (Result<R, Error>) -> Void) where R : Resource
	func locationAreaEncounters(pokemon: Pokemon, _ completion: @escaping (Result<Set<LocationAreaEncounter>, Error>) -> Void)
}

