
public struct ItemCategory : NamedResource {
	public static let endpoint = "item-category"

	public let id : Int
	public let name : String
	public let items : Set<NamedAPIResource<Item>>
	public let names : Set<Name>
	public let pocket : NamedAPIResource<ItemPocket>
}

