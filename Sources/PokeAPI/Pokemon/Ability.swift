
public struct Ability: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case isMainSeries      = "is_main_series"
		case generation
		case names
		case effectEntries     = "effect_entries"
		case effectChanges     = "effect_changes"
		case flavorTextEntries = "flavor_text_entries"
		case pokemon
	}

	public static let endpoint = "ability"

	public var id: Int
	public var name: String
	public var isMainSeries: Bool
	public var generation: NamedAPIResource<Generation>
	public var names: Set<Name>
	public var effectEntries: Set<VerboseEffect>
	public var effectChanges: Set<AbilityEffectChange>
	public var flavorTextEntries: Set<AbilityFlavorText>
	public var pokemon: Set<AbilityPokemon>
}

public struct AbilityEffectChange: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case effectEntries = "effect_entries"
		case versionGroup  = "version_group"
	}

	public var effectEntries: Set<Effect>
	public var versionGroup: NamedAPIResource<VersionGroup>
}

public struct AbilityFlavorText: Localized {
	private enum CodingKeys: String, CodingKey {
		case flavorText    = "flavor_text"
		case language
		case versionGroup  = "version_group"
	}

	public var flavorText: String
	public var language: NamedAPIResource<Language>
	public var versionGroup: NamedAPIResource<VersionGroup>
}

public struct AbilityPokemon: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case isHidden = "is_hidden"
		case slot
		case pokemon
	}

	public var isHidden: Bool
	public var slot: Int
	public var pokemon: NamedAPIResource<Pokemon>
}
