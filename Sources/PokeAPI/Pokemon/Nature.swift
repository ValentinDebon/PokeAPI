
public struct Nature : NamedResource {
	public enum CodingKeys : String, CodingKey {
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

	public let id : Int
	public let name : String
	public let decreasedStat : NamedAPIResource<Stat>
	public let increasedStat : NamedAPIResource<Stat>
	public let hatesFlavor : NamedAPIResource<BerryFlavor>
	public let likesFlavor : NamedAPIResource<BerryFlavor>
	public let pokeathlonStatChanges : Set<NatureStatChange>
	public let moveBattleStylePreferences : Set<MoveBattleStylePreference>
	public let names : Set<Name>
}

public struct NatureStatChange : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case maxChange      = "max_change"
		case pokeathlonStat = "pokeathlon_stat"
	}

	public let maxChange : Int
	public let pokeathlonStat : NamedAPIResource<PokeathlonStat>
}

public struct MoveBattleStylePreference : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case lowHpPreference  = "low_hp_preference"
		case highHpPreference = "high_hp_preference"
		case moveBattleStyle  = "move_battle_style"
	}

	public let lowHpPreference : Int
	public let highHpPreference : Int
	public let moveBattleStyle : NamedAPIResource<MoveBattleStyle>
}

