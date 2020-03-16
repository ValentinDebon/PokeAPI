
public struct PokeathlonStat: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case names
		case affectingNatures = "affecting_natures"
	}

	public static let endpoint = "pokeathlon-stat"

	public var id: Int
	public var name: String
	public var names: Set<Name>
	public var affectingNatures: NaturePokeathlonStatAffectSets
}

public struct NaturePokeathlonStatAffectSets: Codable {
	public var increase: Set<NaturePokeathlonStatAffect>
	public var decrease: Set<NaturePokeathlonStatAffect>
}

public struct NaturePokeathlonStatAffect: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case maxChange = "max_change"
		case nature
	}

	public var maxChange: Int
	public var nature: NamedAPIResource<Nature>
}
