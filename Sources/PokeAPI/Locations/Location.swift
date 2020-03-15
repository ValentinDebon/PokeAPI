
public struct Location : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case region
		case names
		case gameIndices = "game_indices"
		case areas
	}

	public static let endpoint = "location"

	public let id : Int
	public let name : String
	public let region : NamedAPIResource<Region>?
	public let names : Set<Name>
	public let gameIndices : Set<GenerationGameIndex>
	public let areas : Set<NamedAPIResource<LocationArea>>
}

