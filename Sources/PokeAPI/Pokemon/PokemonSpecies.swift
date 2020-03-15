
public struct PokemonSpecies : NamedResource {
	public enum CodingKeys : String, CodingKey {
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

	public let id : Int
	public let name : String
	public let order : Int
	public let genderRate : Int
	public let captureRate : Int
	public let baseHappiness : Int
	public let isBaby : Bool
	public let hatchCounter : Int
	public let hasGenderDifferences : Bool
	public let formsSwitchable : Bool
	public let growthRate : NamedAPIResource<GrowthRate>
	public let pokedexNumbers : Set<PokemonSpeciesDexEntry>
	public let eggGroups : Set<NamedAPIResource<EggGroup>>
	public let color : NamedAPIResource<PokemonColor>
	public let shape : NamedAPIResource<PokemonShape>
	public let evolvesFromSpecies : NamedAPIResource<PokemonSpecies>?
	public let evolutionChain : APIResource<EvolutionChain>
	public let habitat : NamedAPIResource<PokemonHabitat>
	public let generation : NamedAPIResource<Generation>
	public let names : Set<Name>
	public let palParkEncounters : Set<PalParkEncounterArea>
	public let flavorTextEntries : Set<FlavorText>
	public let formDescriptions : Set<Description>
	public let genera : Set<Genus>
	public let varieties : Set<PokemonSpeciesVariety>
}

public struct Genus : Localized {
	public let genus : String
	public let language : NamedAPIResource<Language>
}

public struct PokemonSpeciesDexEntry : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case entryNumber = "entry_number"
		case pokedex
	}

	public let entryNumber : Int
	public let pokedex : NamedAPIResource<Pokedex>
}

public struct PalParkEncounterArea : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case baseScore = "base_score"
		case rate
		case area
	}

	public let baseScore : Int
	public let rate : Int
	public let area : NamedAPIResource<PalParkArea>
}

public struct PokemonSpeciesVariety : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case isDefault = "is_default"
		case pokemon
	}

	public let isDefault : Bool
	public let pokemon : NamedAPIResource<Pokemon>
}

