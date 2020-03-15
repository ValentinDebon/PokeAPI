
public struct Language: NamedResource {
	public static let endpoint = "language"

	public var id: Int
	public var name: String
	public var official: Bool
	public var iso639: String
	public var iso3166: String
	public var names: Set<Name>
}

