
public struct Pokedex: NamedResource {
	public enum CodingKeys: String, CodingKey {
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

	public var id: Int
	public var name: String
	public var isMainSeries: Bool
	public var descriptions: Set<Description>
	public var names: Set<Name>
	public var pokemonEntries: Set<PokemonEntry>
	public var region: NamedAPIResource<Region>?
	public var versionGroups: Set<NamedAPIResource<VersionGroup>>
}

public struct PokemonEntry: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case entryNumber    = "entry_number"
		case pokemonSpecies = "pokemon_species"
	}

	public var entryNumber: Int
	public var pokemonSpecies: NamedAPIResource<PokemonSpecies>

	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.entryNumber)
	}

	public static func ==(lhs: PokemonEntry, rhs: PokemonEntry) -> Bool {
		lhs.entryNumber == rhs.entryNumber
	}
}

