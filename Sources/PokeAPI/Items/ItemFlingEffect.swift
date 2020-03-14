
public struct ItemFlingEffect : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case effectEntries = "effect_entries"
		case items
	}

	public static let endpoint = "item-fling-effect"

	public let id : Int
	public let name : String
	public let effectEntries : Set<Effect>
	public let items : Set<NamedAPIResource<Item>>
}

