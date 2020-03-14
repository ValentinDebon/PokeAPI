
public struct EncounterCondition : NamedResource {
	public static let endpoint = "encounter-condition"

	public let id : Int
	public let name : String
	public let names : Set<Name>
	public let values : Set<NamedAPIResource<EncounterConditionValue>>
}
