import XCTest
@testable import PokeAPI

final class PokeAPITests: XCTestCase {

	func testResource<R, P>(pokeAPI: P, _ resource: R.Type) where R: Resource, P: PokeAPIProtocol {
		if let apiResourceList: APIResourceList<R> = pokeAPI.resourceList() {
			for apiResource in apiResourceList.results {
				let resource: R? = pokeAPI.resource(at: apiResource.url)
				XCTAssertNotNil(resource, "Unable to access \(R.self) resource: \(apiResource)")
			}
		} else {
			XCTFail("Unable to access \(R.self) resource list")
		}
	}

	func testNamedResource<R, P>(pokeAPI: P, _ resource: R.Type) where R: NamedResource, P: PokeAPIProtocol {
		if let apiResourceList: NamedAPIResourceList<R> = pokeAPI.namedResourceList() {
			for apiResource in apiResourceList.results {
				let resource: R? = pokeAPI.resource(at: apiResource.url)
				XCTAssertNotNil(resource, "Unable to access \(R.self) named resource: \(apiResource)")
			}
		} else {
			XCTFail("Unable to access \(R.self) named resource list")
		}
	}

	func testPokeAPILocal() {
		let bundle = Bundle(for: type(of: self))
		guard let url = bundle.url(forResource: "data", withExtension: nil) else {
			XCTFail("Invalid url")
			return
		}

		do {
			let pokeAPILocal = try PokeAPILocal(at: url)

			testNamedResource(pokeAPI: pokeAPILocal, Berry.self)
			testNamedResource(pokeAPI: pokeAPILocal, BerryFirmness.self)
			testNamedResource(pokeAPI: pokeAPILocal, BerryFlavor.self)
			testResource(pokeAPI: pokeAPILocal, ContestEffect.self)
			testNamedResource(pokeAPI: pokeAPILocal, ContestType.self)
			testResource(pokeAPI: pokeAPILocal, SuperContestEffect.self)
			testNamedResource(pokeAPI: pokeAPILocal, EncounterCondition.self)
			testNamedResource(pokeAPI: pokeAPILocal, EncounterConditionValue.self)
			testNamedResource(pokeAPI: pokeAPILocal, EncounterMethod.self)
			testResource(pokeAPI: pokeAPILocal, EvolutionChain.self)
			testNamedResource(pokeAPI: pokeAPILocal, EvolutionTrigger.self)
			testNamedResource(pokeAPI: pokeAPILocal, Generation.self)
			testNamedResource(pokeAPI: pokeAPILocal, Pokedex.self)
			testNamedResource(pokeAPI: pokeAPILocal, Version.self)
			testNamedResource(pokeAPI: pokeAPILocal, VersionGroup.self)
			testNamedResource(pokeAPI: pokeAPILocal, Item.self)
			testNamedResource(pokeAPI: pokeAPILocal, ItemAttribute.self)
			testNamedResource(pokeAPI: pokeAPILocal, ItemCategory.self)
			testNamedResource(pokeAPI: pokeAPILocal, ItemFlingEffect.self)
			testNamedResource(pokeAPI: pokeAPILocal, ItemPocket.self)
			testNamedResource(pokeAPI: pokeAPILocal, Location.self)
			testNamedResource(pokeAPI: pokeAPILocal, LocationArea.self)
			testNamedResource(pokeAPI: pokeAPILocal, PalParkArea.self)
			testNamedResource(pokeAPI: pokeAPILocal, Region.self)
			testResource(pokeAPI: pokeAPILocal, Machine.self)
			testNamedResource(pokeAPI: pokeAPILocal, Move.self)
			testNamedResource(pokeAPI: pokeAPILocal, MoveAilment.self)
			testNamedResource(pokeAPI: pokeAPILocal, MoveBattleStyle.self)
			testNamedResource(pokeAPI: pokeAPILocal, MoveCategory.self)
			testNamedResource(pokeAPI: pokeAPILocal, MoveDamageClass.self)
			testNamedResource(pokeAPI: pokeAPILocal, MoveLearnMethod.self)
			testNamedResource(pokeAPI: pokeAPILocal, MoveTarget.self)
			testNamedResource(pokeAPI: pokeAPILocal, Ability.self)
			testResource(pokeAPI: pokeAPILocal, Characteristic.self)
			testNamedResource(pokeAPI: pokeAPILocal, EggGroup.self)
			testNamedResource(pokeAPI: pokeAPILocal, Gender.self)
			testNamedResource(pokeAPI: pokeAPILocal, GrowthRate.self)
			testNamedResource(pokeAPI: pokeAPILocal, Nature.self)
			testNamedResource(pokeAPI: pokeAPILocal, PokeathlonStat.self)
			testNamedResource(pokeAPI: pokeAPILocal, Pokemon.self)
			testNamedResource(pokeAPI: pokeAPILocal, PokemonColor.self)
			testNamedResource(pokeAPI: pokeAPILocal, PokemonForm.self)
			testNamedResource(pokeAPI: pokeAPILocal, PokemonHabitat.self)
			testNamedResource(pokeAPI: pokeAPILocal, PokemonShape.self)
			testNamedResource(pokeAPI: pokeAPILocal, PokemonSpecies.self)
			testNamedResource(pokeAPI: pokeAPILocal, Stat.self)
			testNamedResource(pokeAPI: pokeAPILocal, Type.self)
			testNamedResource(pokeAPI: pokeAPILocal, Language.self)
		} catch {
			XCTFail(error.localizedDescription)
		}
	}
	
	static var allTests = [
		("testPokeAPILocal", testPokeAPILocal)
	]
}
