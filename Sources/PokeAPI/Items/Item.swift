
public struct Item : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case cost
		case flingPower        = "fling_power"
		case flingEffect       = "fling_effect"
		case attributes
		case category
		case effectEntries     = "effect_entries"
		case flavorTextEntries = "flavor_text_entries"
		case gameIndices       = "game_indices"
		case names
		case sprites
		case heldByPokemon     = "held_by_pokemon"
		case babyTriggerFor    = "baby_trigger_for"
		case machines
	}

	public static let endpoint = "item"

	public let id : Int
	public let name : String
	public let cost : Int
	public let flingPower : Int?
	public let flingEffect : NamedAPIResource<ItemFlingEffect>?
	public let attributes : Set<NamedAPIResource<ItemAttribute>>
	public let category : NamedAPIResource<ItemCategory>
	public let effectEntries : Set<VerboseEffect>
	public let flavorTextEntries : Set<VersionGroupFlavorText>
	public let gameIndices : Set<GenerationGameIndex>
	public let names : Set<Name>
	public let sprites : ItemSprites
	public let heldByPokemon : Set<ItemHolderPokemon>
	public let babyTriggerFor : APIResource<EvolutionChain>?
	public let machines : Set<MachineVersionDetail>
}

public struct ItemSprites : Codable {
	public let `default` : String?
}

public struct ItemHolderPokemon : Hashable, Codable {
	public enum CodingKeys : String, CodingKey {
		case pokemon
		case versionDetails = "version_details"
	}

	public let pokemon : NamedAPIResource<Pokemon>
	public let versionDetails : Set<ItemHolderPokemonVersionDetail>
}

public struct ItemHolderPokemonVersionDetail : Hashable, Codable {
	public let rarity : Int
	public let version : NamedAPIResource<Version>
}
