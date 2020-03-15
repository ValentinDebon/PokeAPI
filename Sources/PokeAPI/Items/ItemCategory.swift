
public struct ItemCategory: NamedResource {
	public static let endpoint = "item-category"

	public var id: Int
	public var name: String
	public var items: Set<NamedAPIResource<Item>>
	public var names: Set<Name>
	public var pocket: NamedAPIResource<ItemPocket>
}

