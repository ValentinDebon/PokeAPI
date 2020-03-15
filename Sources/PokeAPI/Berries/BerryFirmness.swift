
public struct BerryFirmness: NamedResource {
	public static let endpoint = "berry-firmness"

	public var id: Int
	public var name: String
	public var berries: Set<NamedAPIResource<Berry>>
	public var names: Set<Name>
}

