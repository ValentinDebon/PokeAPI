
public struct ContestType : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case berryFlavor = "berry_flavor"
		case names
	}

	public static let endpoint = "contest-type"

	public let id : Int
	public let name : String
	public let berryFlavor : NamedAPIResource<BerryFlavor>
	public let names : Set<ContestName>
}

public struct ContestName : Localized {
	public let name : String
	public let color : String
	public let language : NamedAPIResource<Language>
}

