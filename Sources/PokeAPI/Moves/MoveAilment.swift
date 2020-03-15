
public struct MoveAilment: NamedResource {
	public static let endpoint = "move-ailment"

	public var id: Int
	public var name: String
	public var moves: Set<NamedAPIResource<Move>>
	public var names: Set<Name>
}

