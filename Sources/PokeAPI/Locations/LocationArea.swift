
public struct LocationArea : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case gameIndex            = "game_index"
		case encounterMethodRates = "encounter_method_rates"
		case location
		case names
		case pokemonEncounters    = "pokemon_encounters"
	}

	public static let endpoint = "location-area"

	public let id : Int
	public let name : String
	public let gameIndex : Int
	public let encounterMethodRates : Set<EncounterMethodRate>
	public let location : NamedAPIResource<Location>
	public let names : Set<Name>
	public let pokemonEncounters : Set<PokemonEncounter>
}

public struct EncounterMethodRate : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case encounterMethod = "encounter_method"
		case versionDetails  = "version_details"
	}

	public let encounterMethod : NamedAPIResource<EncounterMethod>
	public let versionDetails : Set<EncounterVersionDetails>
}

public struct EncounterVersionDetails : Hashable, Codable {
	public let rate : Int
	public let version : NamedAPIResource<Version>
}

public struct PokemonEncounter : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case pokemon
		case versionDetails  = "version_details"
	}

	public let pokemon : NamedAPIResource<Pokemon>
	public let versionDetails : Set<VersionEncounterDetail>
}

