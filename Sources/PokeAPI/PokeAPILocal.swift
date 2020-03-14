import Foundation

public final class PokeAPILocal : PokeAPIProtocol {
	private let decoder : JSONDecoder
	public let url : URL
	public var delegate : PokeAPIDelegate?

	public init(at url: URL, delegate: PokeAPIDelegate? = nil) {
		self.decoder = JSONDecoder()
		self.url = url
		self.delegate = delegate
	}

	public func location(endpoint: String, id: String) -> String {
		"api/v2/\(endpoint)/\(id)"
	}
	
	public func resource<R>(at location: String) -> R? where R : Resource {
		try? self.decoder.decode(R.self, from: Data(contentsOf: self.url.appendingPathComponent(location)))
	}
}

public extension PokeAPI {
	static func makeLocal(at url: URL, delegate: PokeAPIDelegate? = nil) -> PokeAPI {
		PokeAPI(real: PokeAPILocal(at: url, delegate: delegate))
	}
}
