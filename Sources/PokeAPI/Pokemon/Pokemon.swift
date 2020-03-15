
public struct Pokemon : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case baseExperience         = "base_experience"
		case height
		case isDefault              = "is_default"
		case order
		case weight
		case abilities
		case forms
		case gameIndices            = "game_indices"
		case heldItems              = "held_items"
		case locationAreaEncounters = "location_area_encounters"
		case moves
		case sprites
		case species
		case stats
		case types
	}

	public static let endpoint = "pokemon"

	public let id : Int
	public let name : String
	public let baseExperience : Int
	public let height : Int
	public let isDefault : Bool
	public let order : Int
	public let weight : Int
	public let abilities : Set<PokemonAbility>
	public let forms : Set<NamedAPIResource<PokemonForm>>
	public let gameIndices : Set<VersionGameIndex>
	public let heldItems : Set<PokemonHeldItem>
	public let locationAreaEncounters : String
	public let moves : Set<PokemonMove>
	public let sprites : PokemonSprites
	public let species : NamedAPIResource<PokemonSpecies>
	public let stats : Set<PokemonStat>
	public let types : Set<PokemonType>
}

public struct PokemonAbility : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case isHidden = "is_hidden"
		case slot
		case ability
	}

	public let isHidden : Bool
	public let slot : Int
	public let ability : NamedAPIResource<Ability>
}

public struct PokemonType : Hashable, Codable {
	public let slot : Int
	public let type : NamedAPIResource<Type>
}

public struct PokemonHeldItem : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case item
		case versionDetails = "version_details"
	}

	public let item : NamedAPIResource<Item>
	public let versionDetails : Set<PokemonHeldItemVersion>
}

public struct PokemonHeldItemVersion : Hashable, Codable {
	public let version : NamedAPIResource<Version>
	public let rarity : Int
}

public struct PokemonMove : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case move
		case versionGroupDetails = "version_group_details"
	}

	public let move : NamedAPIResource<Move>
	public let versionGroupDetails : Set<PokemonMoveVersion>
}

public struct PokemonMoveVersion : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case moveLearnMethod = "move_learn_method"
		case versionGroup    = "version_group"
		case levelLearnedAt  = "level_learned_at"
	}

	public let moveLearnMethod : NamedAPIResource<MoveLearnMethod>
	public let versionGroup : NamedAPIResource<VersionGroup>
	public let levelLearnedAt : Int
}

public struct PokemonStat : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case stat
		case effort
		case baseStat = "base_stat"
	}

	public let stat : NamedAPIResource<Stat>
	public let effort : Int
	public let baseStat : Int
}

public struct PokemonSprites : Codable {
	public enum CodingKeys : String, CodingKey {
		case frontDefault     = "front_default"
		case frontShiny       = "front_shiny"
		case frontFemale      = "front_female"
		case frontShinyFemale = "front_shiny_female"
		case backDefault      = "back_default"
		case backShiny        = "back_shiny"
		case backFemale       = "back_female"
		case backShinyFemale  = "back_shiny_female"
	}

	public let frontDefault : String?
	public let frontShiny : String?
	public let frontFemale : String?
	public let frontShinyFemale : String?
	public let backDefault : String?
	public let backShiny : String?
	public let backFemale : String?
	public let backShinyFemale : String?
}

public struct LocationAreaEncounter : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case locationArea   = "location_area"
		case versionDetails = "version_details"
	}

	public let locationArea : NamedAPIResource<LocationArea>
	public let versionDetails : Set<VersionEncounterDetail>
}
