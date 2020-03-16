
public struct Berry: NamedResource {
	private enum CodingKeys: String, CodingKey {
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

	public var id: Int
	public var name: String
	public var growthTime: Int
	public var maxHarvest: Int
	public var naturalGiftPower: Int
	public var size: Int
	public var smoothness: Int
	public var soilDryness: Int
	public var firmness: NamedAPIResource<BerryFirmness>
	public var flavors: Set<BerryFlavorMap>
	public var item: NamedAPIResource<Item>
	public var naturalGiftType: NamedAPIResource<Type>
}

public struct BerryFlavorMap: Hashable, Codable {
	public var potency: Int
	public var flavor: NamedAPIResource<BerryFlavor>

	public func hash(into hasher: inout Hasher) {
		hasher.combine(self.flavor)
	}

	public static func ==(lhs: BerryFlavorMap, rhs: BerryFlavorMap) -> Bool {
		lhs.flavor == rhs.flavor
	}
}

