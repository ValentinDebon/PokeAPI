
public struct GrowthRate : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case formula
		case descriptions
		case levels
		case pokemonSpecies = "pokemon_species"
	}

	public static let endpoint = "growth-rate"

	public let id : Int
	public let name : String
	public let formula : String
	public let descriptions : Set<Description>
	public let levels : Set<GrowthRateExperienceLevel>
	public let pokemonSpecies : Set<NamedAPIResource<PokemonSpecies>>
}

public struct GrowthRateExperienceLevel : Hashable, Codable {
	public let level : Int
	public let experience : Int
}
