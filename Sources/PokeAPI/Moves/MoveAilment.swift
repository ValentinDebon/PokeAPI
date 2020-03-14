
public struct MoveAilment : NamedResource {
	public static let endpoint = "move-ailment"

	public let id : Int
	public let name : String
	public let moves : Set<NamedAPIResource<Move>>
	public let names : Set<Name>
}

