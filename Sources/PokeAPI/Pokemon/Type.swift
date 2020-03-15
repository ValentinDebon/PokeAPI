
public struct Type : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case damageRelations = "damage_relations"
		case gameIndices     = "game_indices"
		case generation
		case moveDamageClass = "move_damage_class"
		case names
		case pokemon
		case moves
	}

	public static let endpoint = "type"

	public let id : Int
	public let name : String
	public let damageRelations : TypeRelations
	public let gameIndices : Set<GenerationGameIndex>
	public let generation : NamedAPIResource<Generation>
	public let moveDamageClass : NamedAPIResource<MoveDamageClass>?
	public let names : Set<Name>
	public let pokemon : Set<TypePokemon>
	public let moves : Set<NamedAPIResource<Move>>
}

public struct TypePokemon : Hashable, Codable {
	public let slot : Int
	public let pokemon : NamedAPIResource<Pokemon>
}

public struct TypeRelations : Codable {
	public enum CodingKeys : String, CodingKey {
		case noDamageTo       = "no_damage_to"
		case halfDamageTo     = "half_damage_to"
		case doubleDamageTo   = "double_damage_to"
		case noDamageFrom     = "no_damage_from"
		case halfDamageFrom   = "half_damage_from"
		case doubleDamageFrom = "double_damage_from"
	}

	public let noDamageTo : Set<NamedAPIResource<Type>>
	public let halfDamageTo : Set<NamedAPIResource<Type>>
	public let doubleDamageTo : Set<NamedAPIResource<Type>>
	public let noDamageFrom : Set<NamedAPIResource<Type>>
	public let halfDamageFrom : Set<NamedAPIResource<Type>>
	public let doubleDamageFrom : Set<NamedAPIResource<Type>>
}

