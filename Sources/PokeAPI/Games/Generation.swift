
public struct Generation : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case abilities
		case names
		case mainRegion     = "main_region"
		case moves
		case pokemonSpecies = "pokemon_species"
		case types
		case versionGroups  = "version_groups"
	}

	public static let endpoint = "generation"

	public let id : Int
	public let name : String
	public let abilities : Set<NamedAPIResource<Ability>>
	public let names : Set<Name>
	public let mainRegion : NamedAPIResource<Region>
	public let moves : Set<NamedAPIResource<Move>>
	public let pokemonSpecies : Set<NamedAPIResource<PokemonSpecies>>
	public let types : Set<NamedAPIResource<Type>>
	public let versionGroups : Set<NamedAPIResource<VersionGroup>>
}

