
public final class PokeAPIProxy: PokeAPI {
	private let real: PokeAPI
	private let resourcesCountLimit : Int
	private let locationAreaEncountersCountLimit : Int
	private var resources: [[Substring]: Any]
	private var locationAreaEncounters: [Int: Set<LocationAreaEncounter>]

	init(real: PokeAPI, resourcesCountLimit: Int = Int.max, locationAreaEncountersCountLimit: Int = Int.max) {
		self.real = real
		self.resourcesCountLimit = resourcesCountLimit
		self.locationAreaEncountersCountLimit = locationAreaEncountersCountLimit
		self.resources = [:]
		self.locationAreaEncounters = [:]
	}

	private func cachedLocation(for location: String) -> [Substring] {
		location.split(separator: "/", omittingEmptySubsequences: true)
	}

	private func checkResourceUsage() {
		if self.resources.count >= self.resourcesCountLimit,
			let (removedKey, _) = self.resources.randomElement() {
			self.resources.removeValue(forKey: removedKey)
		}
	}

	public func location(endpoint: String, id: String? = nil) -> String? {
		self.real.location(endpoint: endpoint, id: id)
	}

	public func resource<R>(at location: String) -> R? where R: Resource {
		let cachedLocation = self.cachedLocation(for: location)

		if let cached = self.resources[cachedLocation], let resource = cached as? R {
			return resource
		}

		if let resource: R = self.real.resource(at: location) {
			self.checkResourceUsage()
			self.resources[cachedLocation] = resource
			return resource
		}

		return nil
	}
	
	public func locationAreaEncounters(pokemon: Pokemon) -> Set<LocationAreaEncounter>? {
		if let locationAreaEncounters = self.locationAreaEncounters[pokemon.id] {
			return locationAreaEncounters
		}

		if let locationAreaEncounters = self.real.locationAreaEncounters(pokemon: pokemon) {
			if self.locationAreaEncounters.count >= self.locationAreaEncountersCountLimit,
				let (removedKey, _) = self.locationAreaEncounters.randomElement() {
				self.locationAreaEncounters.removeValue(forKey: removedKey)
			}

			self.locationAreaEncounters[pokemon.id] = locationAreaEncounters
			return locationAreaEncounters
		}

		return nil
	}

	public func resourceList<R>() -> APIResourceList<R>? where R: Resource {
		guard let location = self.location(endpoint: R.endpoint) else {
			return nil
		}

		let cachedLocation = self.cachedLocation(for: location)
		if let cached = self.resources[cachedLocation], let resourceList = cached as? APIResourceList<R> {
			return resourceList
		}

		if let resourceList: APIResourceList<R> = self.real.resourceList() {
			self.checkResourceUsage()
			self.resources[cachedLocation] = resourceList
			return resourceList
		}

		return nil
	}

	public func namedResourceList<R>() -> NamedAPIResourceList<R>? where R: NamedResource {
		guard let location = self.location(endpoint: R.endpoint) else {
			return nil
		}

		let cachedLocation = self.cachedLocation(for: location)
		if let cached = self.resources[cachedLocation], let namedResourceList = cached as? NamedAPIResourceList<R> {
			return namedResourceList
		}

		if let namedResourceList: NamedAPIResourceList<R> = self.real.namedResourceList() {
			self.checkResourceUsage()
			self.resources[cachedLocation] = namedResourceList
			return namedResourceList
		}

		return nil
	}
}
