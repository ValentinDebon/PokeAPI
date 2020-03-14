
public struct Version : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case names
		case versionGroup = "version_group"
	}

	public static let endpoint = "version"

	public let id : Int
	public let name : String
	public let names : Set<Name>
	public let versionGroup : NamedAPIResource<VersionGroup>
}

