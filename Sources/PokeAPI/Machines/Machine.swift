
public struct Machine: Resource {
	private enum CodingKeys: String, CodingKey {
		case id
		case item
		case move
		case versionGroup = "version_group"
	}

	public static let endpoint = "machine"

	public var id: Int
	public var item: NamedAPIResource<Item>
	public var move: NamedAPIResource<Move>
	public var versionGroup: NamedAPIResource<VersionGroup>
}

