
public struct Characteristic: Resource {
	public enum CodingKeys: String, CodingKey {
		case id
		case geneModulo     = "gene_modulo"
		case possibleValues = "possible_values"
	}

	public static let endpoint = "characteristic"

	public var id: Int
	public var geneModulo: Int
	public var possibleValues: Set<Int>
}

