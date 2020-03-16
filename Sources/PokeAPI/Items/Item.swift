
public struct Item: NamedResource {
	private enum CodingKeys: String, CodingKey {
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

	public var id: Int
	public var name: String
	public var cost: Int
	public var flingPower: Int?
	public var flingEffect: NamedAPIResource<ItemFlingEffect>?
	public var attributes: Set<NamedAPIResource<ItemAttribute>>
	public var category: NamedAPIResource<ItemCategory>
	public var effectEntries: Set<VerboseEffect>
	public var flavorTextEntries: Set<VersionGroupFlavorText>
	public var gameIndices: Set<GenerationGameIndex>
	public var names: Set<Name>
	public var sprites: ItemSprites
	public var heldByPokemon: Set<ItemHolderPokemon>
	public var babyTriggerFor: APIResource<EvolutionChain>?
	public var machines: Set<MachineVersionDetail>
}

public struct ItemSprites: Codable {
	public var `default`: String?
}

public struct ItemHolderPokemon: Hashable, Codable {
	private enum CodingKeys: String, CodingKey {
		case pokemon
		case versionDetails = "version_details"
	}

	public var pokemon: NamedAPIResource<Pokemon>
	public var versionDetails: Set<ItemHolderPokemonVersionDetail>
}

public struct ItemHolderPokemonVersionDetail: Hashable, Codable {
	public var rarity: Int
	public var version: NamedAPIResource<Version>
}
