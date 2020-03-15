
public struct MoveCategory: NamedResource {
	public static let endpoint = "move-category"

	public var id: Int
	public var name: String
	public var moves: Set<NamedAPIResource<Move>>
	public var descriptions: Set<Description>
}

