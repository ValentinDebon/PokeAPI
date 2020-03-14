
public struct SuperContestEffect : Resource {
	public enum CodingKeys : String, CodingKey {
		case id
		case appeal
		case flavorTextEntries = "flavor_text_entries"
		case moves
	}

	public static let endpoint = "super-contest-effect"

	public let id : Int
	public let appeal : Int
	public let flavorTextEntries : Set<FlavorText>
	public let moves : Set<NamedAPIResource<Move>>
}

