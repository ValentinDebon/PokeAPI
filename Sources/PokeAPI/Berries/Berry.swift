
public struct Berry : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case growthTime       = "growth_time"
		case maxHarvest       = "max_harvest"
		case naturalGiftPower = "natural_gift_power"
		case size
		case smoothness
		case soilDryness      = "soil_dryness"
		case firmness
		case flavors
		case item
		case naturalGiftType  = "natural_gift_type"
	}

	public static let endpoint = "berry"

	public let id : Int
	public let name : String
	public let growthTime : Int
	public let maxHarvest : Int
	public let naturalGiftPower : Int
	public let size : Int
	public let smoothness : Int
	public let soilDryness : Int
	public let firmness : NamedAPIResource<BerryFirmness>
	public let flavors : Set<BerryFlavorMap>
	public let item : NamedAPIResource<Item>
	public let naturalGiftType : NamedAPIResource<Type>
}

public struct BerryFlavorMap : Hashable, Codable {
	public let potency : Int
	public let flavor : NamedAPIResource<BerryFlavor>

	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.flavor)
	}

	public static func ==(lhs: BerryFlavorMap, rhs: BerryFlavorMap) -> Bool {
		lhs.flavor == rhs.flavor
	}
}

