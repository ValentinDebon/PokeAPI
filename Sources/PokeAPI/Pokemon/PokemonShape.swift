
public struct PokemonShape: NamedResource {
	public enum CodingKeys: String, CodingKey {
		case id
		case name
		case awesomeNames   = "awesome_names"
		case names
		case pokemonSpecies = "pokemon_species"
	}

	public static let endpoint = "pokemon-shape"

	public var id: Int
	public var name: String
	public var awesomeNames: Set<AwesomeName>
	public var names: Set<Name>
	public var pokemonSpecies: Set<NamedAPIResource<PokemonSpecies>>
}

public struct AwesomeName: Localized {
	public enum CodingKeys: String, CodingKey {
		case awesomeName = "awesome_name"
		case language
	}

	public var awesomeName: String
	public var language: NamedAPIResource<Language>
}

