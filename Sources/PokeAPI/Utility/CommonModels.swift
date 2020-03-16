
public struct APIResource<R: Resource>: Hashable, Codable {
	public var url: String
}

public struct Description: Localized {
	public var description: String
	public var language: NamedAPIResource<Language>
}

public struct Effect: Localized {
	public var effect: String
	public var language: NamedAPIResource<Language>
}

public struct Encounter: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case minLevel        = "min_level"
		case maxLevel        = "max_level"
		case conditionValues = "condition_values"
		case chance
		case method
	}

	public var minLevel: Int
	public var maxLevel: Int
	public var conditionValues: Set<NamedAPIResource<EncounterConditionValue>>
	public var chance: Int
	public var method: NamedAPIResource<EncounterMethod>
}

public struct FlavorText: Localized {
	private enum CodingKeys: String, CodingKey {
		case flavorText = "flavor_text"
		case language
		case version
	}

	public var flavorText: String
	public var language: NamedAPIResource<Language>
	public var version: NamedAPIResource<Version>?
}

public struct GenerationGameIndex: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case gameIndex = "game_index"
		case generation
	}

	public var gameIndex: Int
	public var generation: NamedAPIResource<Generation>
}

public struct MachineVersionDetail: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case machine
		case versionGroup = "version_group"
	}

	public var machine: APIResource<Machine>
	public var versionGroup: NamedAPIResource<VersionGroup>
}

public struct Name: Localized {
	public var name: String
	public var language: NamedAPIResource<Language>
}

public struct NamedAPIResource<R: NamedResource>: Hashable, Codable {
	public var name: String
	public var url: String

	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.name)
	}

	public static func ==(lhs: Self, rhs: Self) -> Bool {
		lhs.name == rhs.name
	}
}

public struct VerboseEffect: Localized {
	private enum CodingKeys: String, CodingKey {
		case effect
		case shortEffect = "short_effect"
		case language
	}

	public var effect: String
	public var shortEffect: String
	public var language: NamedAPIResource<Language>
}

public struct VersionEncounterDetail: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case version
		case maxChance        = "max_chance"
		case encounterDetails = "encounter_details"
	}

	public var version: NamedAPIResource<Version>
	public var maxChance: Int
	public var encounterDetails: Set<Encounter>
}

public struct VersionGameIndex: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case gameIndex = "game_index"
		case version
	}

	public var gameIndex: Int
	public var version: NamedAPIResource<Version>
}

public struct VersionGroupFlavorText: Localized {
	private enum CodingKeys: String, CodingKey {
		case text
		case language
		case versionGroup = "version_group"
	}

	public var text: String
	public var language: NamedAPIResource<Language>
	public var versionGroup: NamedAPIResource<VersionGroup>
}

