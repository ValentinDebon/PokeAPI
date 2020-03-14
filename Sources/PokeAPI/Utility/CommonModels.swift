
public struct APIResource<R : Resource> : Hashable, Codable {
	public let url : String
}

public struct Description : Localized {
	public let description : String
	public let language : NamedAPIResource<Language>
}

public struct Effect : Localized {
	public let effect : String
	public let language : NamedAPIResource<Language>
}

public struct Encounter : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case minLevel        = "min_level"
		case maxLevel        = "max_level"
		case conditionValues = "condition_values"
		case chance
		case method
	}

	public let minLevel : Int
	public let maxLevel : Int
	public let conditionValues : Set<NamedAPIResource<EncounterConditionValue>>
	public let chance : Int
	public let method : NamedAPIResource<EncounterMethod>
}

public struct FlavorText : Localized {
	public enum CodingKeys : String, CodingKey {
		case flavorText = "flavor_text"
		case language
		case version
	}

	public let flavorText : String
	public let language : NamedAPIResource<Language>
	public let version : NamedAPIResource<Version>
}

public struct GenerationGameIndex : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case gameIndex = "game_index"
		case generation
	}

	public let gameIndex : Int
	public let generation : NamedAPIResource<Generation>
}

public struct MachineVersionDetail : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case machine
		case versionGroup = "version_group"
	}

	public let machine : APIResource<Machine>
	public let versionGroup : NamedAPIResource<VersionGroup>
}

public struct Name : Localized {
	public let name : String
	public let language : NamedAPIResource<Language>
}

public struct NamedAPIResource<T> : Hashable, Codable {
	public let name : String
	public let url : String

	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.name)
	}

	public static func ==(lhs: Self, rhs: Self) -> Bool {
		lhs.name == rhs.name
	}
}

public struct VerboseEffect : Localized {
	public enum CodingKeys : String, CodingKey {
		case effect
		case shortEffect = "short_effect"
		case language
	}

	public let effect : String
	public let shortEffect : String
	public let language : NamedAPIResource<Language>
}

public struct VersionEncounterDetail : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case version
		case maxChance        = "max_chance"
		case encounterDetails = "encounter_details"
	}

	public let version : NamedAPIResource<Version>
	public let maxChance : Int
	public let encounterDetails : Set<Encounter>
}

public struct VersionGameIndex : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case gameIndex = "game_index"
		case version
	}

	public let gameIndex : Int
	public let version : NamedAPIResource<Version>
}

public struct VersionGroupFlavorText : Localized {
	public enum CodingKeys : String, CodingKey {
		case text
		case language
		case versionGroup = "version_group"
	}

	public let text : String
	public let language : NamedAPIResource<Language>
	public let versionGroup : NamedAPIResource<VersionGroup>
}

