
public struct Pokemon: NamedResource {
	public enum CodingKeys: String, CodingKey {
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

	public var id: Int
	public var name: String
	public var baseExperience: Int
	public var height: Int
	public var isDefault: Bool
	public var order: Int
	public var weight: Int
	public var abilities: Set<PokemonAbility>
	public var forms: Set<NamedAPIResource<PokemonForm>>
	public var gameIndices: Set<VersionGameIndex>
	public var heldItems: Set<PokemonHeldItem>
	public var locationAreaEncounters: String
	public var moves: Set<PokemonMove>
	public var sprites: PokemonSprites
	public var species: NamedAPIResource<PokemonSpecies>
	public var stats: Set<PokemonStat>
	public var types: Set<PokemonType>
}

public struct PokemonAbility: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case isHidden = "is_hidden"
		case slot
		case ability
	}

	public var isHidden: Bool
	public var slot: Int
	public var ability: NamedAPIResource<Ability>
}

public struct PokemonType: Hashable, Codable {
	public var slot: Int
	public var type: NamedAPIResource<Type>
}

public struct PokemonHeldItem: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case item
		case versionDetails = "version_details"
	}

	public var item: NamedAPIResource<Item>
	public var versionDetails: Set<PokemonHeldItemVersion>
}

public struct PokemonHeldItemVersion: Hashable, Codable {
	public var version: NamedAPIResource<Version>
	public var rarity: Int
}

public struct PokemonMove: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case move
		case versionGroupDetails = "version_group_details"
	}

	public var move: NamedAPIResource<Move>
	public var versionGroupDetails: Set<PokemonMoveVersion>
}

public struct PokemonMoveVersion: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case moveLearnMethod = "move_learn_method"
		case versionGroup    = "version_group"
		case levelLearnedAt  = "level_learned_at"
	}

	public var moveLearnMethod: NamedAPIResource<MoveLearnMethod>
	public var versionGroup: NamedAPIResource<VersionGroup>
	public var levelLearnedAt: Int
}

public struct PokemonStat: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case stat
		case effort
		case baseStat = "base_stat"
	}

	public var stat: NamedAPIResource<Stat>
	public var effort: Int
	public var baseStat: Int
}

public struct PokemonSprites: Codable {
	public enum CodingKeys: String, CodingKey {
		case frontDefault     = "front_default"
		case frontShiny       = "front_shiny"
		case frontFemale      = "front_female"
		case frontShinyFemale = "front_shiny_female"
		case backDefault      = "back_default"
		case backShiny        = "back_shiny"
		case backFemale       = "back_female"
		case backShinyFemale  = "back_shiny_female"
	}

	public var frontDefault: String?
	public var frontShiny: String?
	public var frontFemale: String?
	public var frontShinyFemale: String?
	public var backDefault: String?
	public var backShiny: String?
	public var backFemale: String?
	public var backShinyFemale: String?
}

public struct LocationAreaEncounter: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case locationArea   = "location_area"
		case versionDetails = "version_details"
	}

	public var locationArea: NamedAPIResource<LocationArea>
	public var versionDetails: Set<VersionEncounterDetail>
}
