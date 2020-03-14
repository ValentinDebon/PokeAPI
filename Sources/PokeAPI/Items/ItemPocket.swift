
public struct ItemPocket : NamedResource {
	public static let endpoint = "item-pocket"

	public let id : Int
	public let name : String
	public let categories : Set<NamedAPIResource<ItemCategory>>
	public let names : Set<Name>
}

