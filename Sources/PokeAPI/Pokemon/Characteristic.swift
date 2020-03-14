
public struct Characteristic : Resource {
	public enum CodingKeys : String, CodingKey {
		case id
		case geneModulo     = "gene_modulo"
		case possibleValues = "possible_values"
	}

	public static let endpoint = "characteristic"

	public let id : Int
	public let geneModulo : Int
	public let possibleValues : Set<Int>
}

