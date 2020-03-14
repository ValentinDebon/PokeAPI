
public struct Ability : NamedResource {
	public enum CodingKeys : String, CodingKey {
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

	public let id : Int
	public let name : String
	public let isMainSeries : Bool
	public let generation : NamedAPIResource<Generation>
	public let names : Set<Name>
	public let effectEntries : Set<VerboseEffect>
	public let effectChanges : Set<AbilityEffectChange>
	public let flavorTextEntries : Set<AbilityFlavorText>
	public let pokemon : Set<AbilityPokemon>
}

public struct AbilityEffectChange : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case effectEntries = "effect_entries"
		case versionGroup  = "version_group"
	}

	public let effectEntries : Set<Effect>
	public let versionGroup : NamedAPIResource<VersionGroup>
}

public struct AbilityFlavorText : Localized {
	public enum CodingKeys : String, CodingKey {
		case flavorText    = "flavor_text"
		case language
		case versionGroup  = "version_group"
	}

	public let flavorText : String
	public let language : NamedAPIResource<Language>
	public let versionGroup : NamedAPIResource<VersionGroup>
}

public struct AbilityPokemon : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case isHidden = "is_hidden"
		case slot
		case pokemon
	}

	public let isHidden : Bool
	public let slot : Int
	public let pokemon : NamedAPIResource<Pokemon>
}
