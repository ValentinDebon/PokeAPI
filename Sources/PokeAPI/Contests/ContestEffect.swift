
public struct ContestEffect : Resource {
	public enum CodingKeys : String, CodingKey {
		case id
		case appeal
		case jam
		case effectEntries     = "effect_entries"
		case flavorTextEntries = "flavor_text_entries"
	}

	public static let endpoint = "contest-effect"

	public let id : Int
	public let appeal : Int
	public let jam : Int
	public let effectEntries : Set<Effect>
	public let flavorTextEntries : Set<FlavorText>
}

