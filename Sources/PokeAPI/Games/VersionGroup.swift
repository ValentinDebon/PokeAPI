
public struct VersionGroup : NamedResource {
	public enum CodingKeys : String, CodingKey {
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

	public let id : Int
	public let name : String
	public let order : Int
	public let generation : NamedAPIResource<Generation>
	public let moveLearnMethods : Set<NamedAPIResource<MoveLearnMethod>>
	public let pokedexes : Set<NamedAPIResource<Pokedex>>
	public let regions : Set<NamedAPIResource<Region>>
	public let versions : Set<NamedAPIResource<Version>>
}

