
public struct Region : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case locations
		case names
		case mainGeneration = "main_generation"
		case pokedexes
		case versionGroups  = "version_groups"
	}

	public static let endpoint = "region"

	public let id : Int
	public let name : String
	public let locations : Set<NamedAPIResource<Location>>
	public let names : Set<Name>
	public let mainGeneration : NamedAPIResource<Generation>
	public let pokedexes : Set<NamedAPIResource<Pokedex>>
	public let versionGroups : Set<NamedAPIResource<VersionGroup>>
}

