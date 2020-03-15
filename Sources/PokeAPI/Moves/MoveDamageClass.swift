
public struct MoveDamageClass: NamedResource {
	public static let endpoint = "move-damage-class"

	public var id: Int
	public var name: String
	public var descriptions: Set<Description>
	public var moves: Set<NamedAPIResource<Move>>
	public var names: Set<Name>
}

