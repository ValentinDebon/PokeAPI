
public struct ItemFlingEffect: NamedResource {
	public enum CodingKeys: String, CodingKey {
		case id
		case name
		case effectEntries = "effect_entries"
		case items
	}

	public static let endpoint = "item-fling-effect"

	public var id: Int
	public var name: String
	public var effectEntries: Set<Effect>
	public var items: Set<NamedAPIResource<Item>>
}

