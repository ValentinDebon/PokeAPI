
public struct EncounterMethod : NamedResource {
	public static let endpoint = "encounter-method"

	public let id : Int
	public let name : String
	public let order : Int
	public let names : Set<Name>
}

