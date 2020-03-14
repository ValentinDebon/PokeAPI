
public struct BerryFirmness : NamedResource {
	public static let endpoint = "berry-firmness"

	public let id : Int
	public let name : String
	public let berries : Set<NamedAPIResource<Berry>>
	public let names : Set<Name>
}

