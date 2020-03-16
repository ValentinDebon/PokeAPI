
public struct Generation: NamedResource {
	private enum CodingKeys: String, CodingKey {
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

	public var id: Int
	public var name: String
	public var abilities: Set<NamedAPIResource<Ability>>
	public var names: Set<Name>
	public var mainRegion: NamedAPIResource<Region>
	public var moves: Set<NamedAPIResource<Move>>
	public var pokemonSpecies: Set<NamedAPIResource<PokemonSpecies>>
	public var types: Set<NamedAPIResource<Type>>
	public var versionGroups: Set<NamedAPIResource<VersionGroup>>
}

