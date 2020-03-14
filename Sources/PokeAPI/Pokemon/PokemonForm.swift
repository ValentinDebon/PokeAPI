
public struct PokemonForm : NamedResource {
	public enum CodingKeys : String, CodingKey {
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

	public let id : Int
	public let name : String
	public let order : Int
	public let formOrder : Int
	public let isDefault : Bool
	public let isBattleOnly : Bool
	public let isMega : Bool
	public let formName : String
	public let pokemon : NamedAPIResource<Pokemon>
	public let sprites : PokemonFormSprites
	public let versionGroup : NamedAPIResource<VersionGroup>
	public let names : Set<Name>
	public let formNames : Set<Name>
}

public struct PokemonFormSprites : Codable {
	public enum CodingKeys : String, CodingKey {
		case frontDefault     = "front_default"
		case frontShiny       = "front_shiny"
		case backDefault      = "back_default"
		case backShiny        = "back_shiny"
	}

	public let frontDefault : String
	public let frontShiny : String
	public let backDefault : String
	public let backShiny : String
}

