
public struct BerryFlavor: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case berries
		case contestType = "contest_type"
		case names
	}

	public static let endpoint = "berry-flavor"

	public var id: Int
	public var name: String
	public var berries: Set<FlavorBerryMap>
	public var contestType: NamedAPIResource<ContestType>
	public var names: Set<Name>
}

public struct FlavorBerryMap: Hashable, Codable {
	public var potency: Int
	public var berry: NamedAPIResource<Berry>

	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.berry)
	}

	public static func ==(lhs: FlavorBerryMap, rhs: FlavorBerryMap) -> Bool {
		lhs.berry == rhs.berry
	}
}

