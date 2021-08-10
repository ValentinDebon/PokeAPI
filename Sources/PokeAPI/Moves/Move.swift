
public struct Move: NamedResource {
	private enum CodingKeys: String, CodingKey {
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

	public var id: Int
	public var name: String
	public var accuracy: Int?
	public var effectChance: Int?
	public var pp: Int?
	public var priority: Int
	public var power: Int?
	public var contestCombos: ContestComboSets?
	public var contestType: NamedAPIResource<ContestType>?
	public var contestEffect: APIResource<ContestEffect>?
	public var damageClass: NamedAPIResource<MoveDamageClass>?
	public var effectEntries: Set<VerboseEffect>
	public var effectChanges: Set<AbilityEffectChange>
	public var flavorTextEntries: Set<MoveFlavorText>
	public var generation: NamedAPIResource<Generation>
	public var machines: Set<MachineVersionDetail>
	public var meta: MoveMetaData?
	public var names: Set<Name>
	public var pastValues: Set<PastMoveStatValues>
	public var statChanges: Set<MoveStatChange>
	public var superContestEffect: APIResource<SuperContestEffect>?
	public var target: NamedAPIResource<MoveTarget>
	public var type: NamedAPIResource<Type>?
}

public struct ContestComboSets: Codable {
	public var normal: ContestComboDetail
	public var `super`: ContestComboDetail
}

public struct ContestComboDetail: Codable {
	private enum CodingKeys: String, CodingKey {
		case useBefore = "use_before"
		case useAfter  = "use_after"
	}

	public var useBefore: Set<NamedAPIResource<Move>>?
	public var useAfter: Set<NamedAPIResource<Move>>?
}

public struct MoveFlavorText: Localized {
	private enum CodingKeys: String, CodingKey {
		case flavorText   = "flavor_text"
		case language
		case versionGroup = "version_group"
	}

	public var flavorText: String
	public var language: NamedAPIResource<Language>
	public var versionGroup: NamedAPIResource<VersionGroup>
}

public struct MoveMetaData: Codable {
	private enum CodingKeys: String, CodingKey {
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

	public var ailment: NamedAPIResource<MoveAilment>
	public var category: NamedAPIResource<MoveCategory>
	public var minHits: Int?
	public var maxHits: Int?
	public var minTurns: Int?
	public var maxTurns: Int?
	public var drain: Int
	public var healing: Int
	public var critRate: Int
	public var ailmentChance: Int
	public var flinchChance: Int
	public var statChance: Int
}

public struct MoveStatChange: Hashable, Codable {
	public var change: Int
	public var stat: NamedAPIResource<Stat>
}

public struct PastMoveStatValues: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case accuracy
		case effectChance  = "effect_chance"
		case power
		case pp
		case effectEntries = "effect_entries"
		case type
		case versionGroup  = "version_group"
	}

	public var accuracy: Int?
	public var effectChance: Int?
	public var power: Int?
	public var pp: Int?
	public var effectEntries: Set<VerboseEffect>
	public var type: NamedAPIResource<Type>?
	public var versionGroup: NamedAPIResource<VersionGroup>
}
