
public struct Stat: NamedResource {
	public enum CodingKeys: String, CodingKey {
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

	public var id: Int
	public var name: String
	public var gameIndex: Int
	public var isBattleOnly: Bool
	public var affectingMoves: MoveStatAffectSets
	public var affectingNatures: NatureStatAffectSets
	public var characteristics: Set<APIResource<Characteristic>>
	public var moveDamageClass: NamedAPIResource<MoveDamageClass>?
	public var names: Set<Name>
}

public struct MoveStatAffectSets: Codable {
	public var increase: Set<MoveStatAffect>
	public var decrease: Set<MoveStatAffect>
}

public struct MoveStatAffect: Hashable, Codable {
	public var change: Int
	public var move: NamedAPIResource<Move>
}

public struct NatureStatAffectSets: Codable {
	public var increase: Set<NamedAPIResource<Nature>>
	public var decrease: Set<NamedAPIResource<Nature>>
}

