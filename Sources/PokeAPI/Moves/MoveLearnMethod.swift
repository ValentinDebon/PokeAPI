
public struct MoveLearnMethod: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case descriptions
		case names
		case versionGroups = "version_groups"
	}

	public static let endpoint = "move-learn-method"

	public var id: Int
	public var name: String
	public var descriptions: Set<Description>
	public var names: Set<Name>
	public var versionGroups: Set<NamedAPIResource<VersionGroup>>
}

