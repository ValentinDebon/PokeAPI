
public struct MoveTarget: NamedResource {
	public static let endpoint = "move-target"

	public var id: Int
	public var name: String
	public var descriptions: Set<Description>
	public var moves: Set<NamedAPIResource<Move>>
	public var names: Set<Name>
}

