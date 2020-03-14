
public struct PokeathlonStat : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case names
		case affectingNatures = "affecting_natures"
	}

	public static let endpoint = "pokeathlon-stat"

	public let id : Int
	public let name : String
	public let names : Set<Name>
	public let affectingNatures : NaturePokeathlonStatAffectSets
}

public struct NaturePokeathlonStatAffectSets : Codable {
	public let increase : Set<NaturePokeathlonStatAffect>
	public let decrease : Set<NaturePokeathlonStatAffect>
}

public struct NaturePokeathlonStatAffect : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case maxChange = "max_change"
		case nature
	}

	public let maxChange : Int
	public let nature : NamedAPIResource<Nature>
}
