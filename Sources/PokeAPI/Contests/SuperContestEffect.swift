
public struct SuperContestEffect: Resource {
	public enum CodingKeys: String, CodingKey {
		case id
		case appeal
		case flavorTextEntries = "flavor_text_entries"
		case moves
	}

	public static let endpoint = "super-contest-effect"

	public var id: Int
	public var appeal: Int
	public var flavorTextEntries: Set<FlavorText>
	public var moves: Set<NamedAPIResource<Move>>
}

