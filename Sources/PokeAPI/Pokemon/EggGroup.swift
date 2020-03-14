
public struct EggGroup : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case names
		case pokemonSpecies = "pokemon_species"
	}

	public static let endpoint = "egg-group"

	public let id : Int
	public let name : String
	public let names : Set<Name>
	public let pokemonSpecies : Set<NamedAPIResource<PokemonSpecies>>
}

