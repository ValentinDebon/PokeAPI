
public final class PokeAPIProxy: PokeAPI {
	private let real: PokeAPI
	private var resources: [String: Any]
	private var locationAreaEncounters: [Int: Set<LocationAreaEncounter>]

	init(real: PokeAPI) {
		self.real = real
		self.resources = [:]
		self.locationAreaEncounters = [:]
	}

	public func location(endpoint: String, id: String? = nil) -> String? {
		self.real.location(endpoint: endpoint, id: id)
	}

	public func resource<R>(at location: String) -> R? where R: Resource {
		if let cached = self.resources[location], let resource = cached as? R {
			return resource
		}

		if let resource: R = self.real.resource(at: location) {
			self.resources[location] = resource
			return resource
		}

		return nil
	}
	
	public func locationAreaEncounters(pokemon: Pokemon) -> Set<LocationAreaEncounter>? {
		if let locationAreaEncounters = self.locationAreaEncounters[pokemon.id] {
			return locationAreaEncounters
		}

		if let locationAreaEncounters = self.real.locationAreaEncounters(pokemon: pokemon) {
			self.locationAreaEncounters[pokemon.id] = locationAreaEncounters
			return locationAreaEncounters
		}

		return nil
	}

	public func resourceList<R>() -> APIResourceList<R>? where R: Resource {
		guard let location = self.location(endpoint: R.endpoint) else {
			return nil
		}

		if let cached = self.resources[location], let resourceList = cached as? APIResourceList<R> {
			return resourceList
		}

		if let resourceList: APIResourceList<R> = self.real.resourceList() {
			self.resources[location] = resourceList
			return resourceList
		}

		return nil
	}

	public func namedResourceList<R>() -> NamedAPIResourceList<R>? where R: NamedResource {
		guard let location = self.location(endpoint: R.endpoint) else {
			return nil
		}

		if let cached = self.resources[location], let namedResourceList = cached as? NamedAPIResourceList<R> {
			return namedResourceList
		}

		if let namedResourceList: NamedAPIResourceList<R> = self.real.namedResourceList() {
			self.resources[location] = namedResourceList
			return namedResourceList
		}

		return nil
	}
}
