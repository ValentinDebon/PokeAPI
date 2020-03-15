
public struct Location: NamedResource {
	public enum CodingKeys: String, CodingKey {
		case id
		case name
		case region
		case names
		case gameIndices = "game_indices"
		case areas
	}

	public static let endpoint = "location"

	public var id: Int
	public var name: String
	public var region: NamedAPIResource<Region>?
	public var names: Set<Name>
	public var gameIndices: Set<GenerationGameIndex>
	public var areas: Set<NamedAPIResource<LocationArea>>
}

