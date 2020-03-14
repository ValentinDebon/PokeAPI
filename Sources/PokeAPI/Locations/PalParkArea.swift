
public struct PalParkArea : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case names
		case pokemonEncounters = "pokemon_encounters"
	}

	public static let endpoint = "pal-park-area"

	public let id : Int
	public let name : String
	public let names : Set<Name>
	public let pokemonEncounters : Set<PalParkEncounterSpecies>
}

public struct PalParkEncounterSpecies : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case baseScore      = "base_score"
		case rate
		case pokemonSpecies = "pokemon_species"
	}

	public let baseScore : Int
	public let rate : Int
	public let pokemonSpecies : Set<NamedAPIResource<PokemonSpecies>>
}

