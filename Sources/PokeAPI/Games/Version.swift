
public struct Version: NamedResource {
	public enum CodingKeys: String, CodingKey {
		case id
		case name
		case names
		case versionGroup = "version_group"
	}

	public static let endpoint = "version"

	public var id: Int
	public var name: String
	public var names: Set<Name>
	public var versionGroup: NamedAPIResource<VersionGroup>
}

