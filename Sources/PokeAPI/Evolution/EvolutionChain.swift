
public struct EvolutionChain: Resource {
	public enum CodingKeys: String, CodingKey {
		case id
		case babyTriggerItem = "baby_trigger_item"
		case chain
	}

	public static let endpoint = "evolution-chain"

	public var id: Int
	public var babyTriggerItem: NamedAPIResource<Item>?
	public var chain: ChainLink
}

public struct ChainLink: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case isBaby           = "is_baby"
		case species
		case evolutionDetails = "evolution_details"
		case evolvesTo        = "evolves_to"
	}

	public var isBaby: Bool
	public var species: NamedAPIResource<PokemonSpecies>
	public var evolutionDetails: Set<EvolutionDetail>
	public var evolvesTo: Set<ChainLink>
}

public struct EvolutionDetail: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case item
		case trigger
		case gender
		case heldItem              = "held_item"
		case knownMove             = "known_move"
		case knownMoveType         = "known_move_type"
		case location
		case minLevel              = "min_level"
		case minHappiness          = "min_happiness"
		case minBeauty             = "min_beauty"
		case minAffection          = "min_affection"
		case needsOverworldRain    = "needs_overworld_rain"
		case partySpecies          = "party_species"
		case partyType             = "party_type"
		case relativePhysicalStats = "relative_physical_stats"
		case timeOfDay             = "time_of_day"
		case tradeSpecies          = "trade_species"
		case turnUpsideDown        = "turn_upside_down"
	}

	public var item: NamedAPIResource<Item>?
	public var trigger: NamedAPIResource<EvolutionTrigger>
	public var gender: Int?
	public var heldItem: NamedAPIResource<Item>?
	public var knownMove: NamedAPIResource<Move>?
	public var knownMoveType: NamedAPIResource<Type>?
	public var location: NamedAPIResource<Location>?
	public var minLevel: Int?
	public var minHappiness: Int?
	public var minBeauty: Int?
	public var minAffection: Int?
	public var needsOverworldRain: Bool
	public var partySpecies: NamedAPIResource<PokemonSpecies>?
	public var partyType: NamedAPIResource<Type>?
	public var relativePhysicalStats: Int?
	public var timeOfDay: String
	public var tradeSpecies: NamedAPIResource<PokemonSpecies>?
	public var turnUpsideDown: Bool
}

