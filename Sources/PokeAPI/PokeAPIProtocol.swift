
public protocol PokeAPIProtocol: AnyObject {
	func location(endpoint: String, id: String?) -> String?
	func resource<R>(at location: String) -> R? where R: Resource
	func locationAreaEncounters(pokemon: Pokemon) -> Set<LocationAreaEncounter>?
	func resourceList<R>() -> APIResourceList<R>? where R: Resource
	func namedResourceList<R>() -> NamedAPIResourceList<R>? where R: NamedResource
}

public extension PokeAPIProtocol {
	@inlinable func unnamed<R>(_ apiResource: APIResource<R>) -> R? where R: Resource {
		self.resource(at: apiResource.url)
	}

	@inlinable func named<R>(_ apiResource: NamedAPIResource<R>) -> R? where R: NamedResource {
		self.resource(at: apiResource.url)
	}

	@inlinable func resource<R, S>(id: S) -> R? where R: Resource, S: LosslessStringConvertible {
		guard let location = self.location(endpoint: R.endpoint, id: String(id)) else {
			return nil
		}

		return self.resource(at: location)
	}

	@inlinable func berry<S>(id: S) -> Berry? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func berryFirmness<S>(id: S) -> BerryFirmness? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func berryFlavor<S>(id: S) -> BerryFlavor? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func contestEffect<S>(id: S) -> ContestEffect? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func contestType<S>(id: S) -> ContestType? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func superContestEffect<S>(id: S) -> SuperContestEffect? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func encounterCondition<S>(id: S) -> EncounterCondition? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func encounterConditionValue<S>(id: S) -> EncounterConditionValue? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func encounterMethod<S>(id: S) -> EncounterMethod? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func evolutionChain<S>(id: S) -> EvolutionChain? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func evolutionTrigger<S>(id: S) -> EvolutionTrigger? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func generation<S>(id: S) -> Generation? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func pokedex<S>(id: S) -> Pokedex? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func version<S>(id: S) -> Version? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func versionGroup<S>(id: S) -> VersionGroup? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func item<S>(id: S) -> Item? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func itemAttribute<S>(id: S) -> ItemAttribute? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func itemCategory<S>(id: S) -> ItemCategory? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func itemFlingEffect<S>(id: S) -> ItemFlingEffect? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func itemPocket<S>(id: S) -> ItemPocket? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func location<S>(id: S) -> Location? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func locationArea<S>(id: S) -> LocationArea? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func palParkArea<S>(id: S) -> PalParkArea? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func region<S>(id: S) -> Region? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func machine<S>(id: S) -> Machine? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func move<S>(id: S) -> Move? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func moveAilment<S>(id: S) -> MoveAilment? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func moveBattleStyle<S>(id: S) -> MoveBattleStyle? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func moveCategory<S>(id: S) -> MoveCategory? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func moveDamageClass<S>(id: S) -> MoveDamageClass? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func moveLearnMethod<S>(id: S) -> MoveLearnMethod? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func moveTarget<S>(id: S) -> MoveTarget? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func ability<S>(id: S) -> Ability? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func characteristic<S>(id: S) -> Characteristic? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func eggGroup<S>(id: S) -> EggGroup? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func gender<S>(id: S) -> Gender? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func growthRate<S>(id: S) -> GrowthRate? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func nature<S>(id: S) -> Nature? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func pokeathlonStat<S>(id: S) -> PokeathlonStat? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func pokemon<S>(id: S) -> Pokemon? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func pokemonColor<S>(id: S) -> PokemonColor? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func pokemonForm<S>(id: S) -> PokemonForm? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func pokemonHabitat<S>(id: S) -> PokemonHabitat? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func pokemonShape<S>(id: S) -> PokemonShape? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func pokemonSpecies<S>(id: S) -> PokemonSpecies? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func stat<S>(id: S) -> Stat? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func type<S>(id: S) -> Type? where S: LosslessStringConvertible {
		self.resource(id: id)
	}

	@inlinable func language<S>(id: S) -> Language? where S: LosslessStringConvertible {
		self.resource(id: id)
	}
}

