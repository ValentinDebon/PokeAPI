
public struct EncounterConditionValue : NamedResource {
	public static let endpoint = "encounter-condition-value"

	public let id : Int
	public let name : String
	public let condition : NamedAPIResource<EncounterCondition>
	public let names : Set<Name>
}
