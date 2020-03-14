
public struct MoveCategory : NamedResource {
	public static let endpoint = "move-category"

	public let id : Int
	public let name : String
	public let moves : Set<NamedAPIResource<Move>>
	public let descriptions : Set<Description>
}

