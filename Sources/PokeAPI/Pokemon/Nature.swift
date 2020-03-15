
public struct Nature: NamedResource {
	public enum CodingKeys: String, CodingKey {
		case id
		case name
		case decreasedStat              = "decreased_stat"
		case increasedStat              = "increased_stat"
		case hatesFlavor                = "hates_flavor"
		case likesFlavor                = "likes_flavor"
		case pokeathlonStatChanges      = "pokeathlon_stat_changes"
		case moveBattleStylePreferences = "move_battle_style_preferences"
		case names
	}

	public static let endpoint = "nature"

	public var id: Int
	public var name: String
	public var decreasedStat: NamedAPIResource<Stat>?
	public var increasedStat: NamedAPIResource<Stat>?
	public var hatesFlavor: NamedAPIResource<BerryFlavor>?
	public var likesFlavor: NamedAPIResource<BerryFlavor>?
	public var pokeathlonStatChanges: Set<NatureStatChange>
	public var moveBattleStylePreferences: Set<MoveBattleStylePreference>
	public var names: Set<Name>
}

public struct NatureStatChange: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case maxChange      = "max_change"
		case pokeathlonStat = "pokeathlon_stat"
	}

	public var maxChange: Int
	public var pokeathlonStat: NamedAPIResource<PokeathlonStat>
}

public struct MoveBattleStylePreference: Hashable, Codable {
	public enum CodingKeys: String, CodingKey {
		case lowHpPreference  = "low_hp_preference"
		case highHpPreference = "high_hp_preference"
		case moveBattleStyle  = "move_battle_style"
	}

	public var lowHpPreference: Int
	public var highHpPreference: Int
	public var moveBattleStyle: NamedAPIResource<MoveBattleStyle>
}

