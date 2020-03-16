
public struct Gender: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case pokemonSpeciesDetails = "pokemon_species_details"
		case requiredForEvolution  = "required_for_evolution"
	}

	public static let endpoint = "gender"

	public var id: Int
	public var name: String
	public var pokemonSpeciesDetails: Set<PokemonSpeciesGender>
	public var requiredForEvolution: Set<NamedAPIResource<PokemonSpecies>>
}

public struct PokemonSpeciesGender: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case rate
		case pokemonSpecies = "pokemon_species"
	}

	public var rate: Int
	public var pokemonSpecies: NamedAPIResource<PokemonSpecies>
}

