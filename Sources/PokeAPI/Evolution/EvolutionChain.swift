
public struct EvolutionChain : Resource {
	public enum CodingKeys : String, CodingKey {
		case id
		case babyTriggerItem = "baby_trigger_item"
		case chain
	}

	public static let endpoint = "evolution-chain"

	public let id : Int
	public let babyTriggerItem : NamedAPIResource<Item>?
	public let chain : ChainLink
}

public struct ChainLink : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case isBaby           = "is_baby"
		case species
		case evolutionDetails = "evolution_details"
		case evolvesTo        = "evolves_to"
	}

	public let isBaby : Bool
	public let species : NamedAPIResource<PokemonSpecies>
	public let evolutionDetails : Set<EvolutionDetail>
	public let evolvesTo : Set<ChainLink>
}

public struct EvolutionDetail : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
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

	public let item : NamedAPIResource<Item>?
	public let trigger : NamedAPIResource<EvolutionTrigger>
	public let gender : Int?
	public let heldItem : NamedAPIResource<Item>?
	public let knownMove : NamedAPIResource<Move>?
	public let knownMoveType : NamedAPIResource<Type>?
	public let location : NamedAPIResource<Location>?
	public let minLevel : Int?
	public let minHappiness : Int?
	public let minBeauty : Int?
	public let minAffection : Int?
	public let needsOverworldRain : Bool
	public let partySpecies : NamedAPIResource<PokemonSpecies>?
	public let partyType : NamedAPIResource<Type>?
	public let relativePhysicalStats : Int?
	public let timeOfDay : String
	public let tradeSpecies : NamedAPIResource<PokemonSpecies>?
	public let turnUpsideDown : Bool
}

