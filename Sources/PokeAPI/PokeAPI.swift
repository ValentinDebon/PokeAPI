
public final class PokeAPI : PokeAPIProtocol {
	private let real : PokeAPIProtocol
	private var resources : [String : Any]

	init(real: PokeAPIProtocol) {
		self.real = real
		self.resources = [:]
	}

	public var delegate : PokeAPIDelegate? {
		get { self.real.delegate }
		set { self.real.delegate = newValue }
	}

	public func location(endpoint: String, id: String) -> String? {
		self.real.location(endpoint: endpoint, id: id)
	}

	public func resource<R>(at location: String) -> R? where R : Resource {
		if let cached = self.resources[location], let resource = cached as? R {
			return resource
		}

		if let resource : R = self.real.resource(at: location) {
			self.resources[location] = resource
			return resource
		}

		return nil
	}
}
