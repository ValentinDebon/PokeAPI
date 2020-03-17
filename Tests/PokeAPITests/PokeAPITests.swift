import XCTest
@testable import PokeAPI

final class PokeAPITests: XCTestCase {

	func testResource<R, P>(pokeAPI: P, _ resource: R.Type) where R: Resource, P: PokeAPI {
		if let apiResourceList: APIResourceList<R> = pokeAPI.resourceList() {
			for apiResource in apiResourceList.results {
				let resource: R? = pokeAPI.resource(at: apiResource.url)
				XCTAssertNotNil(resource, "Unable to access \(R.self) resource: \(apiResource)")
			}
		} else {
			XCTFail("Unable to access \(R.self) resource list")
		}
	}

	func testNamedResource<R, P>(pokeAPI: P, _ resource: R.Type) where R: NamedResource, P: PokeAPI {
		if let apiResourceList: NamedAPIResourceList<R> = pokeAPI.namedResourceList() {
			for apiResource in apiResourceList.results {
				let resource: R? = pokeAPI.resource(at: apiResource.url)
				XCTAssertNotNil(resource, "Unable to access \(R.self) named resource: \(apiResource)")
			}
		} else {
			XCTFail("Unable to access \(R.self) named resource list")
		}
	}

	func testPokeAPI<P>(pokeAPI: P) where P : PokeAPI {
		testNamedResource(pokeAPI: pokeAPI, Berry.self)
		testNamedResource(pokeAPI: pokeAPI, BerryFirmness.self)
		testNamedResource(pokeAPI: pokeAPI, BerryFlavor.self)
		testResource(pokeAPI: pokeAPI, ContestEffect.self)
		testNamedResource(pokeAPI: pokeAPI, ContestType.self)
		testResource(pokeAPI: pokeAPI, SuperContestEffect.self)
		testNamedResource(pokeAPI: pokeAPI, EncounterCondition.self)
		testNamedResource(pokeAPI: pokeAPI, EncounterConditionValue.self)
		testNamedResource(pokeAPI: pokeAPI, EncounterMethod.self)
		testResource(pokeAPI: pokeAPI, EvolutionChain.self)
		testNamedResource(pokeAPI: pokeAPI, EvolutionTrigger.self)
		testNamedResource(pokeAPI: pokeAPI, Generation.self)
		testNamedResource(pokeAPI: pokeAPI, Pokedex.self)
		testNamedResource(pokeAPI: pokeAPI, Version.self)
		testNamedResource(pokeAPI: pokeAPI, VersionGroup.self)
		testNamedResource(pokeAPI: pokeAPI, Item.self)
		testNamedResource(pokeAPI: pokeAPI, ItemAttribute.self)
		testNamedResource(pokeAPI: pokeAPI, ItemCategory.self)
		testNamedResource(pokeAPI: pokeAPI, ItemFlingEffect.self)
		testNamedResource(pokeAPI: pokeAPI, ItemPocket.self)
		testNamedResource(pokeAPI: pokeAPI, Location.self)
		testNamedResource(pokeAPI: pokeAPI, LocationArea.self)
		testNamedResource(pokeAPI: pokeAPI, PalParkArea.self)
		testNamedResource(pokeAPI: pokeAPI, Region.self)
		testResource(pokeAPI: pokeAPI, Machine.self)
		testNamedResource(pokeAPI: pokeAPI, Move.self)
		testNamedResource(pokeAPI: pokeAPI, MoveAilment.self)
		testNamedResource(pokeAPI: pokeAPI, MoveBattleStyle.self)
		testNamedResource(pokeAPI: pokeAPI, MoveCategory.self)
		testNamedResource(pokeAPI: pokeAPI, MoveDamageClass.self)
		testNamedResource(pokeAPI: pokeAPI, MoveLearnMethod.self)
		testNamedResource(pokeAPI: pokeAPI, MoveTarget.self)
		testNamedResource(pokeAPI: pokeAPI, Ability.self)
		testResource(pokeAPI: pokeAPI, Characteristic.self)
		testNamedResource(pokeAPI: pokeAPI, EggGroup.self)
		testNamedResource(pokeAPI: pokeAPI, Gender.self)
		testNamedResource(pokeAPI: pokeAPI, GrowthRate.self)
		testNamedResource(pokeAPI: pokeAPI, Nature.self)
		testNamedResource(pokeAPI: pokeAPI, PokeathlonStat.self)
		testNamedResource(pokeAPI: pokeAPI, Pokemon.self)
		testNamedResource(pokeAPI: pokeAPI, PokemonColor.self)
		testNamedResource(pokeAPI: pokeAPI, PokemonForm.self)
		testNamedResource(pokeAPI: pokeAPI, PokemonHabitat.self)
		testNamedResource(pokeAPI: pokeAPI, PokemonShape.self)
		testNamedResource(pokeAPI: pokeAPI, PokemonSpecies.self)
		testNamedResource(pokeAPI: pokeAPI, Stat.self)
		testNamedResource(pokeAPI: pokeAPI, Type.self)
		testNamedResource(pokeAPI: pokeAPI, Language.self)
	}

	func testPokeAPILocal() {
		guard let url = Bundle(for: type(of: self)).resourceURL else {
			XCTFail("Invalid url")
			return
		}

		do {
			let pokeAPILocal = try PokeAPILocal(at: url)
			testPokeAPI(pokeAPI: pokeAPILocal)
		} catch {
			XCTFail(error.localizedDescription)
		}
	}

	func testPokeAPIProxy() {
		guard let url = Bundle(for: type(of: self)).resourceURL else {
			XCTFail("Invalid url")
			return
		}

		do {
			let pokeAPIProxy = PokeAPIProxy(real: try PokeAPILocal(at: url), resourcesCountLimit: 1, locationAreaEncountersCountLimit: 1)
			testPokeAPI(pokeAPI: pokeAPIProxy)
		} catch {
			XCTFail(error.localizedDescription)
		}
	}

	static var allTests = [
		("testPokeAPILocal", testPokeAPILocal),
		("testPokeAPIProxy", testPokeAPIProxy),
	]
}
