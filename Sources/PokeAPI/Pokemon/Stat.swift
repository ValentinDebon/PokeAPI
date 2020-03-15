
public struct Stat : NamedResource {
	public enum CodingKeys : String, CodingKey {
		case id
		case name
		case gameIndex        = "game_index"
		case isBattleOnly     = "is_battle_only"
		case affectingMoves   = "affecting_moves"
		case affectingNatures = "affecting_natures"
		case characteristics
		case moveDamageClass  = "move_damage_class"
		case names
	}

	public static let endpoint = "stat"

	public let id : Int
	public let name : String
	public let gameIndex : Int
	public let isBattleOnly : Bool
	public let affectingMoves : MoveStatAffectSets
	public let affectingNatures : NatureStatAffectSets
	public let characteristics : Set<APIResource<Characteristic>>
	public let moveDamageClass : NamedAPIResource<MoveDamageClass>?
	public let names : Set<Name>
}

public struct MoveStatAffectSets : Codable {
	public let increase : Set<MoveStatAffect>
	public let decrease : Set<MoveStatAffect>
}

public struct MoveStatAffect : Hashable, Codable {
	public let change : Int
	public let move : NamedAPIResource<Move>
}

public struct NatureStatAffectSets : Codable {
	public let increase : Set<NamedAPIResource<Nature>>
	public let decrease : Set<NamedAPIResource<Nature>>
}

