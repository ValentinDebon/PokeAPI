
public struct Machine : Resource {
	public enum CodingKeys : String, CodingKey {
		case id
		case item
		case move
		case versionGroup = "version_group"
	}

	public static let endpoint = "machine"

	public let id : Int
	public let item : NamedAPIResource<Item>
	public let move : NamedAPIResource<Move>
	public let versionGroup : NamedAPIResource<VersionGroup>
}

