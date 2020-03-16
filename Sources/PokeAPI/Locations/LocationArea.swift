
public struct LocationArea: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case gameIndex            = "game_index"
		case encounterMethodRates = "encounter_method_rates"
		case location
		case names
		case pokemonEncounters    = "pokemon_encounters"
	}

	public static let endpoint = "location-area"

	public var id: Int
	public var name: String
	public var gameIndex: Int
	public var encounterMethodRates: Set<EncounterMethodRate>
	public var location: NamedAPIResource<Location>
	public var names: Set<Name>
	public var pokemonEncounters: Set<PokemonEncounter>
}

public struct EncounterMethodRate: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case encounterMethod = "encounter_method"
		case versionDetails  = "version_details"
	}

	public var encounterMethod: NamedAPIResource<EncounterMethod>
	public var versionDetails: Set<EncounterVersionDetails>
}

public struct EncounterVersionDetails: Hashable, Codable {
	public var rate: Int
	public var version: NamedAPIResource<Version>
}

public struct PokemonEncounter: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case pokemon
		case versionDetails  = "version_details"
	}

	public var pokemon: NamedAPIResource<Pokemon>
	public var versionDetails: Set<VersionEncounterDetail>
}

