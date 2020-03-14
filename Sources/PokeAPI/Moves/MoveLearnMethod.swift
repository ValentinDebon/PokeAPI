
public struct MoveLearnMethod : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case descriptions
		case names
		case versionGroups = "version_groups"
	}

	public static let endpoint = "move-learn-method"

	public let id : Int
	public let name : String
	public let descriptions : Set<Description>
	public let names : Set<Name>
	public let versionGroups : Set<NamedAPIResource<VersionGroup>>
}

