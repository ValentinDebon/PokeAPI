
public struct Pokedex : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case isMainSeries   = "is_main_series"
		case descriptions
		case names
		case pokemonEntries = "pokemon_entries"
		case region
		case versionGroups  = "version_groups"
	}

	public static let endpoint = "pokedex"

	public let id : Int
	public let name : String
	public let isMainSeries : Bool
	public let descriptions : Set<Description>
	public let names : Set<Name>
	public let pokemonEntries : Set<PokemonEntry>
	public let region : NamedAPIResource<Region>
	public let versionGroups : Set<NamedAPIResource<VersionGroup>>
}

public struct PokemonEntry : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case entryNumber    = "entry_number"
		case pokemonSpecies = "pokemon_species"
	}

	public let entryNumber : Int
	public let pokemonSpecies : NamedAPIResource<PokemonSpecies>

	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.entryNumber)
	}

	public static func ==(lhs: PokemonEntry, rhs: PokemonEntry) -> Bool {
		lhs.entryNumber == rhs.entryNumber
	}
}

