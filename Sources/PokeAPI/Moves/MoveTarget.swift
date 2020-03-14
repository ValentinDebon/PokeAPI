
public struct MoveTarget : NamedResource {
	public static let endpoint = "move-target"

	public let id : Int
	public let name : String
	public let descriptions : Set<Description>
	public let moves : Set<NamedAPIResource<Move>>
	public let names : Set<Name>
}

