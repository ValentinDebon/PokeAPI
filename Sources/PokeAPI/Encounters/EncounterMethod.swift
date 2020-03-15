
public struct EncounterMethod: NamedResource {
	public static let endpoint = "encounter-method"

	public var id: Int
	public var name: String
	public var order: Int
	public var names: Set<Name>
}

