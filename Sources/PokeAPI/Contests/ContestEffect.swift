
public struct ContestEffect: Resource {
	public enum CodingKeys: String, CodingKey {
		case id
		case appeal
		case jam
		case effectEntries     = "effect_entries"
		case flavorTextEntries = "flavor_text_entries"
	}

	public static let endpoint = "contest-effect"

	public var id: Int
	public var appeal: Int
	public var jam: Int
	public var effectEntries: Set<Effect>
	public var flavorTextEntries: Set<FlavorText>
}

