
public struct EncounterCondition: NamedResource {
	public static let endpoint = "encounter-condition"

	public var id: Int
	public var name: String
	public var names: Set<Name>
	public var values: Set<NamedAPIResource<EncounterConditionValue>>
}
