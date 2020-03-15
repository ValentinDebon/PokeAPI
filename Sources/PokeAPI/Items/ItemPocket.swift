
public struct ItemPocket: NamedResource {
	public static let endpoint = "item-pocket"

	public var id: Int
	public var name: String
	public var categories: Set<NamedAPIResource<ItemCategory>>
	public var names: Set<Name>
}

