
public struct PokemonShape : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case awesomeNames   = "awesome_names"
		case names
		case pokemonSpecies = "pokemon_species"
	}

	public static let endpoint = "pokemon-shape"

	public let id : Int
	public let name : String
	public let awesomeNames : Set<AwesomeName>
	public let names : Set<Name>
	public let pokemonSpecies : Set<NamedAPIResource<PokemonSpecies>>
}

public struct AwesomeName : Localized {
	public enum CodingKeys : String, CodingKey {
		case awesomeName = "awesome_name"
		case language
	}

	public let awesomeName : String
	public let language : NamedAPIResource<Language>
}

