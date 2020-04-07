
fileprivate extension APIResourceList {
	mutating func preceded(by resourceList: Self?) {
		self.previous = nil
		self.next = nil

		if let previousResults = resourceList?.results {
			self.results.formUnion(previousResults)
		}
	}
}

fileprivate extension NamedAPIResourceList {
	mutating func preceded(by resourceList: Self?) {
		self.previous = nil
		self.next = nil

		if let previousResults = resourceList?.results {
			self.results.formUnion(previousResults)
		}
	}
}

public final class PokeAPIProxy : PokeAPI {
	private let realAPI : PokeAPI
	private var endpoints : [String : String]
	private var resources : [String : Any]
	private var locationAreaEncounters : [Int : Set<LocationAreaEncounter>]

	public init(realAPI: PokeAPI) {
		self.realAPI = realAPI
		self.endpoints = [:]
		self.resources = [:]
		self.locationAreaEncounters = [:]
	}

	public func endpoints(_ completion: (Result<[String : String], Error>) -> Void) {
		if self.endpoints.isEmpty {
			self.realAPI.endpoints {
				switch $0 {
				case .success(let endpoints):
					self.endpoints = endpoints
				default:
					break
				}

				completion($0)
			}
		} else {
			completion(.success(self.endpoints))
		}
	}

	public func resourceList<R>(_ completion: (Result<APIResourceList<R>, Error>) -> Void) where R : Resource {
		self.endpoints {
			switch $0 {
			case .success(let endpoints):
				let endpoint = endpoints[R.endpoint]!
				if let resourceList = self.resources[endpoint] as? APIResourceList<R> {
					completion(.success(resourceList))
				} else {
					self.realAPI.resourceList({
						switch $0 {
						case .success(var resourceList):
							resourceList.preceded(by: self.resources[endpoint] as? APIResourceList<R>)
							self.resources[endpoint] = resourceList
							completion(.success(resourceList))
						case .failure(let error):
							completion(.failure(error))
						}
					} as (Result<APIResourceList<R>, Error>) -> Void)
				}
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}

	public func namedResourceList<R>(_ completion: (Result<NamedAPIResourceList<R>, Error>) -> Void) where R : NamedResource {
		self.endpoints {
			switch $0 {
			case .success(let endpoints):
				let endpoint = endpoints[R.endpoint]!
				if let namedResourceList = self.resources[endpoint] as? NamedAPIResourceList<R> {
					completion(.success(namedResourceList))
				} else {
					self.realAPI.namedResourceList({
						switch $0 {
						case .success(var namedResourceList):
							namedResourceList.preceded(by: self.resources[endpoint] as? NamedAPIResourceList<R>)
							self.resources[endpoint] = namedResourceList
							completion(.success(namedResourceList))
						case .failure(let error):
							completion(.failure(error))
						}
					} as (Result<NamedAPIResourceList<R>, Error>) -> Void)
				}
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}

	public func resource<R>(atLocation location: String, _ completion: (Result<R, Error>) -> Void) where R : Resource {
		if let resource = self.resources[location] as? R {
			completion(.success(resource))
		} else {
			self.realAPI.resource(atLocation: location, {
				switch $0 {
				case .success(let resource):
					self.resources[location] = resource
					completion(.success(resource))
				case .failure(let error):
					completion(.failure(error))
				}
			} as (Result<R, Error>) -> Void)
		}
	}

	public func locationAreaEncounters(pokemon: Pokemon, _ completion: (Result<Set<LocationAreaEncounter>, Error>) -> Void) {
		if let locationAreaEncounters = self.locationAreaEncounters[pokemon.id] {
			completion(.success(locationAreaEncounters))
		} else {
			self.realAPI.locationAreaEncounters(pokemon: pokemon) {
				switch $0 {
				case .success(let locationAreaEncounters):
					self.locationAreaEncounters[pokemon.id] = locationAreaEncounters
					completion(.success(locationAreaEncounters))
				case .failure(let error):
					completion(.failure(error))
				}
			}
		}
	}
}

