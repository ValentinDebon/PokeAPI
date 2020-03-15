
public struct ItemAttribute: NamedResource {
	public static let endpoint = "item-attribute"

	public var id: Int
	public var name: String
	public var items: Set<NamedAPIResource<Item>>
	public var names: Set<Name>
	public var descriptions: Set<Description>
}

