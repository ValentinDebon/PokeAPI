
public final class PokeAPI : PokeAPIProtocol {
	private final class NamedResourcesList {
		var count : Int
		var results : [String : String]

		init(count: Int, results: [String : String]) {
			self.count = count
			self.results = results
		}
	}

	private let real : PokeAPIProtocol
	private var namedResourcesLists : [String : NamedResourcesList]
	private var resources : [String : Any]

	init(real: PokeAPIProtocol) {
		self.real = real
		self.namedResourcesLists = [:]
		self.resources = [:]
	}

	public var delegate : PokeAPIDelegate? {
		get { self.real.delegate }
		set { self.real.delegate = newValue }
	}

	public func location(endpoint: String, id: String) -> String {
		/* TODO: Handle resource lists */
		self.real.location(endpoint: endpoint, id: id)
	}

	public func resource<R>(at location: String) -> R? where R : Resource {
		fatalError("unimplemented")
	}
}
