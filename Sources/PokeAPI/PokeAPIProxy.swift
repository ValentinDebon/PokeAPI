
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

	public func endpoints() async throws -> [String : String] {

		if self.endpoints.isEmpty {
			self.endpoints = try await self.realAPI.endpoints()
		}

		return self.endpoints
	}

	public func resourceList<R>(at location: String?) async throws -> APIResourceList<R> where R : Resource {
		let endpoint : String
		
		if let location = location {
			endpoint = location
		} else {
			endpoint = try await self.endpoints()[R.endpoint]!
		}

		guard let resourceList = self.resources[endpoint] as? APIResourceList<R> else {
			let resourceList : APIResourceList<R> = try await self.realAPI.resourceList()
			self.resources[endpoint] = resourceList
			return resourceList
		}

		return resourceList
	}

	public func namedResourceList<R>(at location: String?) async throws -> NamedAPIResourceList<R> where R : NamedResource {
		let endpoint : String
		
		if let location = location {
			endpoint = location
		} else {
			endpoint = try await self.endpoints()[R.endpoint]!
		}

		guard let namedResourceList = self.resources[endpoint] as? NamedAPIResourceList<R> else {
			let namedResourceList : NamedAPIResourceList<R> = try await self.realAPI.namedResourceList()
			self.resources[endpoint] = namedResourceList
			return namedResourceList
		}

		return namedResourceList
	}

	public func resource<R>(at location: String) async throws -> R where R : Resource {

		guard let resource = self.resources[location] as? R else {
			let resource : R = try await self.realAPI.resource(at: location)
			self.resources[location] = resource
			return resource
		}

		return resource
	}

	public func locationAreaEncounters(pokemon: Pokemon) async throws -> Set<LocationAreaEncounter> {

		guard let locationAreaEncounters = self.locationAreaEncounters[pokemon.id] else {
			let locationAreaEncounters = try await self.realAPI.locationAreaEncounters(pokemon: pokemon)
			self.locationAreaEncounters[pokemon.id] = locationAreaEncounters
			return locationAreaEncounters
		}

		return locationAreaEncounters
	}
}

