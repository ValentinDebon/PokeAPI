
public struct Region: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case locations
		case names
		case mainGeneration = "main_generation"
		case pokedexes
		case versionGroups  = "version_groups"
	}

	public static let endpoint = "region"

	public var id: Int
	public var name: String
	public var locations: Set<NamedAPIResource<Location>>
	public var names: Set<Name>
	public var mainGeneration: NamedAPIResource<Generation>
	public var pokedexes: Set<NamedAPIResource<Pokedex>>
	public var versionGroups: Set<NamedAPIResource<VersionGroup>>
}

