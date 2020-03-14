
public struct BerryFlavor : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case berries
		case contestType = "contest_type"
		case names
	}

	public static let endpoint = "berry-flavor"

	public let id : Int
	public let name : String
	public let berries : Set<FlavorBerryMap>
	public let contestType : NamedAPIResource<ContestType>
	public let names : Set<Name>
}

public struct FlavorBerryMap : Hashable, Codable {
	public let potency : Int
	public let berry : NamedAPIResource<Berry>

	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.berry)
	}

	public static func ==(lhs: FlavorBerryMap, rhs: FlavorBerryMap) -> Bool {
		lhs.berry == rhs.berry
	}
}

