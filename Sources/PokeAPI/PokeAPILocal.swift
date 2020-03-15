import Foundation

public final class PokeAPILocal : PokeAPIProtocol {
	private let url : URL
	private let decoder : JSONDecoder
	private let endpoints : [String : String]
	public var delegate : PokeAPIDelegate?

	public init(at url: URL, index: String = "/api/v2/index.json", delegate: PokeAPIDelegate? = nil) throws {
		self.url = url
		self.decoder = JSONDecoder()
		self.endpoints = try self.decoder.decode([String : String].self, from: Data(contentsOf: url.appendingPathComponent(index)))
		self.delegate = delegate
	}

	public func location(endpoint: String, id: String) -> String? {
		guard let endpoint = self.endpoints[endpoint] else {
			return nil
		}

		return endpoint + id
	}

	public func resource<R>(at location: String) -> R? where R : Resource {
		try? self.decoder.decode(R.self, from: Data(contentsOf: self.url.appendingPathComponent(location).appendingPathComponent("index.json")))
	}
}

