
public struct MoveDamageClass : NamedResource {
	public static let endpoint = "move-damage-class"

	public let id : Int
	public let name : String
	public let descriptions : Set<Description>
	public let moves : Set<NamedAPIResource<Move>>
	public let names : Set<Name>
}

