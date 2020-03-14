
public struct Item : NamedResource {
	public static let endpoint = "item"

	public let id : Int
	public let name : String
	public let cost : Int
	public let flingPower : Int
	public let flingEffect : NamedAPIResource<ItemFlingEffect>
	public let attributes : NamedAPIResource<ItemAttribute>
	public let category : NamedAPIResource<ItemCategory>
	public let effectEntries : Set<VerboseEffect>
	public let flavorTextEntries : Set<VersionGroupFlavorText>
	public let gameIndices : Set<GenerationGameIndex>
	public let names : Set<Name>
	public let sprites : ItemSprites
	public let heldByPokemon : Set<ItemHolderPokemon>
	public let babyTriggerFor : APIResource<EvolutionChain>
	public let machines : Set<MachineVersionDetail>
}

public struct ItemSprites : Codable {
	public let `default` : String
}

public struct ItemHolderPokemon : Hashable, Codable {
	public let pokemon : String
	public let versionDetails : Set<ItemHolderPokemonVersionDetail>
}

public struct ItemHolderPokemonVersionDetail : Hashable, Codable {
	public let rarity : Int
	public let version : NamedAPIResource<Version>
}
