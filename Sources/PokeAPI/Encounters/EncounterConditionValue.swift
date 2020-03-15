
public struct EncounterConditionValue: NamedResource {
	public static let endpoint = "encounter-condition-value"

	public var id: Int
	public var name: String
	public var condition: NamedAPIResource<EncounterCondition>
	public var names: Set<Name>
}
