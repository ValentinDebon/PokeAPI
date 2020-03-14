
public struct ItemAttribute : NamedResource {
	public static let endpoint = "item-attribute"

	public let id : Int
	public let name : String
	public let items : Set<NamedAPIResource<Item>>
	public let names : Set<Name>
	public let descriptions : Set<Description>
}

