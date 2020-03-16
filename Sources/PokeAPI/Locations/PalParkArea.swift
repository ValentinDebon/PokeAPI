
public struct PalParkArea: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case names
		case pokemonEncounters = "pokemon_encounters"
	}

	public static let endpoint = "pal-park-area"

	public var id: Int
	public var name: String
	public var names: Set<Name>
	public var pokemonEncounters: Set<PalParkEncounterSpecies>
}

public struct PalParkEncounterSpecies: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case baseScore      = "base_score"
		case rate
		case pokemonSpecies = "pokemon_species"
	}

	public var baseScore: Int
	public var rate: Int
	public var pokemonSpecies: NamedAPIResource<PokemonSpecies>
}

