
public struct PokemonColor: NamedResource {
	public enum CodingKeys: String, CodingKey {
		case id
		case name
		case names
		case pokemonSpecies = "pokemon_species"
	}

	public static let endpoint = "pokemon-color"

	public var id: Int
	public var name: String
	public var names: Set<Name>
	public var pokemonSpecies: Set<NamedAPIResource<PokemonSpecies>>
}

