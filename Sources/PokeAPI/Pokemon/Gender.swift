
public struct Gender : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case pokemonSpeciesDetails = "pokemon_species_details"
		case requiredForEvolution  = "required_for_evolution"
	}

	public static let endpoint = "gender"

	public let id : Int
	public let name : String
	public let pokemonSpeciesDetails : Set<PokemonSpeciesGender>
	public let requiredForEvolution : Set<NamedAPIResource<PokemonSpecies>>
}

public struct PokemonSpeciesGender : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case rate
		case pokemonSpecies = "pokemon_species"
	}

	public let rate : Int
	public let pokemonSpecies : NamedAPIResource<PokemonSpecies>
}

