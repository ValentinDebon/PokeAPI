
public struct Type: NamedResource {
	private enum CodingKeys: String, CodingKey {
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

	public var id: Int
	public var name: String
	public var damageRelations: TypeRelations
	public var gameIndices: Set<GenerationGameIndex>
	public var generation: NamedAPIResource<Generation>
	public var moveDamageClass: NamedAPIResource<MoveDamageClass>?
	public var names: Set<Name>
	public var pokemon: Set<TypePokemon>
	public var moves: Set<NamedAPIResource<Move>>
}

public struct TypePokemon: Hashable, Codable {
	public var slot: Int
	public var pokemon: NamedAPIResource<Pokemon>
}

public struct TypeRelations: Codable {
	private enum CodingKeys: String, CodingKey {
		case noDamageTo       = "no_damage_to"
		case halfDamageTo     = "half_damage_to"
		case doubleDamageTo   = "double_damage_to"
		case noDamageFrom     = "no_damage_from"
		case halfDamageFrom   = "half_damage_from"
		case doubleDamageFrom = "double_damage_from"
	}

	public var noDamageTo: Set<NamedAPIResource<Type>>
	public var halfDamageTo: Set<NamedAPIResource<Type>>
	public var doubleDamageTo: Set<NamedAPIResource<Type>>
	public var noDamageFrom: Set<NamedAPIResource<Type>>
	public var halfDamageFrom: Set<NamedAPIResource<Type>>
	public var doubleDamageFrom: Set<NamedAPIResource<Type>>
}

