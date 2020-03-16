
public struct GrowthRate: NamedResource {
	private enum CodingKeys: String, CodingKey {
		case id
		case name
		case formula
		case descriptions
		case levels
		case pokemonSpecies = "pokemon_species"
	}

	public static let endpoint = "growth-rate"

	public var id: Int
	public var name: String
	public var formula: String
	public var descriptions: Set<Description>
	public var levels: Set<GrowthRateExperienceLevel>
	public var pokemonSpecies: Set<NamedAPIResource<PokemonSpecies>>
}

public struct GrowthRateExperienceLevel: Hashable, Codable {
	public var level: Int
	public var experience: Int
}
