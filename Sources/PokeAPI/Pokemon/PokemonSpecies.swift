
public struct PokemonSpecies: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case order
		case genderRate           = "gender_rate"
		case captureRate          = "capture_rate"
		case baseHappiness        = "base_happiness"
		case isBaby               = "is_baby"
		case hatchCounter         = "hatch_counter"
		case hasGenderDifferences = "has_gender_differences"
		case formsSwitchable      = "forms_switchable"
		case growthRate           = "growth_rate"
		case pokedexNumbers       = "pokedex_numbers"
		case eggGroups            = "egg_groups"
		case color
		case shape
		case evolvesFromSpecies   = "evolves_from_species"
		case evolutionChain       = "evolution_chain"
		case habitat
		case generation
		case names
		case palParkEncounters    = "pal_park_encounters"
		case flavorTextEntries    = "flavor_text_entries"
		case formDescriptions     = "form_descriptions"
		case genera
		case varieties
	}

	public static let endpoint = "pokemon-species"

	public var id: Int
	public var name: String
	public var order: Int
	public var genderRate: Int
	public var captureRate: Int
	public var baseHappiness: Int
	public var isBaby: Bool
	public var hatchCounter: Int
	public var hasGenderDifferences: Bool
	public var formsSwitchable: Bool
	public var growthRate: NamedAPIResource<GrowthRate>
	public var pokedexNumbers: Set<PokemonSpeciesDexEntry>
	public var eggGroups: Set<NamedAPIResource<EggGroup>>
	public var color: NamedAPIResource<PokemonColor>
	public var shape: NamedAPIResource<PokemonShape>
	public var evolvesFromSpecies: NamedAPIResource<PokemonSpecies>?
	public var evolutionChain: APIResource<EvolutionChain>
	public var habitat: NamedAPIResource<PokemonHabitat>?
	public var generation: NamedAPIResource<Generation>
	public var names: Set<Name>
	public var palParkEncounters: Set<PalParkEncounterArea>
	public var flavorTextEntries: Set<FlavorText>
	public var formDescriptions: Set<Description>
	public var genera: Set<Genus>
	public var varieties: Set<PokemonSpeciesVariety>
}

public struct Genus: Localized {
	public var genus: String
	public var language: NamedAPIResource<Language>
}

public struct PokemonSpeciesDexEntry: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case entryNumber = "entry_number"
		case pokedex
	}

	public var entryNumber: Int
	public var pokedex: NamedAPIResource<Pokedex>
}

public struct PalParkEncounterArea: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case baseScore = "base_score"
		case rate
		case area
	}

	public var baseScore: Int
	public var rate: Int
	public var area: NamedAPIResource<PalParkArea>
}

public struct PokemonSpeciesVariety: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case isDefault = "is_default"
		case pokemon
	}

	public var isDefault: Bool
	public var pokemon: NamedAPIResource<Pokemon>
}

