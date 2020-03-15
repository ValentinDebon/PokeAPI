
public struct Move : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case accuracy
		case effectChance       = "effect_chance"
		case pp
		case priority
		case power
		case contestCombos      = "contest_combos"
		case contestType        = "contest_type"
		case contestEffect      = "contest_effect"
		case damageClass        = "damage_class"
		case effectEntries      = "effect_entries"
		case effectChanges      = "effect_changes"
		case flavorTextEntries  = "flavor_text_entries"
		case generation
		case machines
		case meta
		case names
		case pastValues         = "past_values"
		case statChanges        = "stat_changes"
		case superContestEffect = "super_contest_effect"
		case target
		case type
	}

	public static let endpoint = "move"

	public let id : Int
	public let name : String
	public let accuracy : Int?
	public let effectChance : Int?
	public let pp : Int?
	public let priority : Int
	public let power : Int?
	public let contestCombos : ContestComboSets?
	public let contestType : NamedAPIResource<ContestType>?
	public let contestEffect : APIResource<ContestEffect>?
	public let damageClass : NamedAPIResource<MoveDamageClass>
	public let effectEntries : Set<VerboseEffect>
	public let effectChanges : Set<AbilityEffectChange>
	public let flavorTextEntries : Set<MoveFlavorText>
	public let generation : NamedAPIResource<Generation>
	public let machines : Set<MachineVersionDetail>
	public let meta : MoveMetaData?
	public let names : Set<Name>
	public let pastValues : Set<PastMoveStatValues>
	public let statChanges : Set<MoveStatChange>
	public let superContestEffect : APIResource<SuperContestEffect>?
	public let target : NamedAPIResource<MoveTarget>
	public let type : NamedAPIResource<Type>?
}

public struct ContestComboSets : Codable {
	public let normal : ContestComboDetail
	public let `super` : ContestComboDetail
}

public struct ContestComboDetail : Codable {
	public enum CodingKeys : String, CodingKey {
		case useBefore = "use_before"
		case useAfter  = "use_after"
	}

	public let useBefore : Set<NamedAPIResource<Move>>?
	public let useAfter : Set<NamedAPIResource<Move>>?
}

public struct MoveFlavorText : Localized {
	public enum CodingKeys : String, CodingKey {
		case flavorText   = "flavor_text"
		case language
		case versionGroup = "version_group"
	}

	public let flavorText : String
	public let language : NamedAPIResource<Language>
	public let versionGroup : NamedAPIResource<VersionGroup>
}

public struct MoveMetaData : Codable {
	public enum CodingKeys : String, CodingKey {
		case ailment
		case category
		case minHits       = "min_hits"
		case maxHits       = "max_hits"
		case minTurns      = "min_turns"
		case maxTurns      = "max_turns"
		case drain
		case healing
		case critRate      = "crit_rate"
		case ailmentChance = "ailment_chance"
		case flinchChance  = "flinch_chance"
		case statChance    = "stat_chance"
	}

	public let ailment : NamedAPIResource<MoveAilment>
	public let category : NamedAPIResource<MoveCategory>
	public let minHits : Int?
	public let maxHits : Int?
	public let minTurns : Int?
	public let maxTurns : Int?
	public let drain : Int
	public let healing : Int
	public let critRate : Int
	public let ailmentChance : Int
	public let flinchChance : Int
	public let statChance : Int
}

public struct MoveStatChange : Hashable, Codable {
	public let change : Int
	public let stat : NamedAPIResource<Stat>
}

public struct PastMoveStatValues : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case accuracy
		case effectChance  = "effect_chance"
		case power
		case pp
		case effectEntries = "effect_entries"
		case type
		case versionGroup  = "version_group"
	}

	public let accuracy : Int?
	public let effectChance : Int?
	public let power : Int?
	public let pp : Int?
	public let effectEntries : Set<VerboseEffect>
	public let type : NamedAPIResource<Type>?
	public let versionGroup : NamedAPIResource<VersionGroup>
}
