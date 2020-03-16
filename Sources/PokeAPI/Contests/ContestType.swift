
public struct ContestType: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case berryFlavor = "berry_flavor"
		case names
	}

	public static let endpoint = "contest-type"

	public var id: Int
	public var name: String
	public var berryFlavor: NamedAPIResource<BerryFlavor>
	public var names: Set<ContestName>
}

public struct ContestName: Localized {
	public var name: String
	public var color: String
	public var language: NamedAPIResource<Language>
}

