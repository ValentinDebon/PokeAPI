
public struct PokemonForm: NamedResource {
	public enum CodingKeys: String, CodingKey {
		case id
		case name
		case order
		case formOrder    = "form_order"
		case isDefault    = "is_default"
		case isBattleOnly = "is_battle_only"
		case isMega       = "is_mega"
		case formName     = "form_name"
		case pokemon
		case sprites
		case versionGroup = "version_group"
		case names
		case formNames    = "form_names"
	}

	public static let endpoint = "pokemon-form"

	public var id: Int
	public var name: String
	public var order: Int
	public var formOrder: Int
	public var isDefault: Bool
	public var isBattleOnly: Bool
	public var isMega: Bool
	public var formName: String
	public var pokemon: NamedAPIResource<Pokemon>
	public var sprites: PokemonFormSprites
	public var versionGroup: NamedAPIResource<VersionGroup>
	public var names: Set<Name>
	public var formNames: Set<Name>
}

public struct PokemonFormSprites: Codable {
	public enum CodingKeys: String, CodingKey {
		case frontDefault     = "front_default"
		case frontShiny       = "front_shiny"
		case backDefault      = "back_default"
		case backShiny        = "back_shiny"
	}

	public var frontDefault: String?
	public var frontShiny: String?
	public var backDefault: String?
	public var backShiny: String?
}

