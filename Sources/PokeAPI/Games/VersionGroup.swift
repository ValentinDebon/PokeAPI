
public struct VersionGroup: NamedResource {
	public enum CodingKeys: String, CodingKey {
		case id
		case name
		case order
		case generation
		case moveLearnMethods = "move_learn_methods"
		case pokedexes
		case regions
		case versions
	}

	public static let endpoint = "version-group"

	public var id: Int
	public var name: String
	public var order: Int
	public var generation: NamedAPIResource<Generation>
	public var moveLearnMethods: Set<NamedAPIResource<MoveLearnMethod>>
	public var pokedexes: Set<NamedAPIResource<Pokedex>>
	public var regions: Set<NamedAPIResource<Region>>
	public var versions: Set<NamedAPIResource<Version>>
}

