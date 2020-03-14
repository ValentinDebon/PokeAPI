
public struct Language : NamedResource {
	public static let endpoint = "language"

	public let id : Int
	public let name : String
	public let official : Bool
	public let iso639 : String
	public let iso3166 : String
	public let names : Set<Name>
}

