import XCTest
@testable import PokeAPI

final class PokeAPITests: XCTestCase {
	func testPokeAPILocal() {
		let bundle = Bundle(for: type(of: self))
		guard let url = bundle.url(forResource: "data", withExtension: nil) else {
			XCTFail("Invalid url")
			return
		}

		do {
			let pokeAPILocal = try PokeAPILocal(at: url)

			XCTAssertNotNil(pokeAPILocal.ability(id: 1))
			XCTAssertNotNil(pokeAPILocal.berry(id: 1))
			XCTAssertNotNil(pokeAPILocal.berryFirmness(id: 1))
			XCTAssertNotNil(pokeAPILocal.berryFlavor(id: 1))
			XCTAssertNotNil(pokeAPILocal.contestEffect(id: 1))
			XCTAssertNotNil(pokeAPILocal.contestType(id: 1))
			XCTAssertNotNil(pokeAPILocal.superContestEffect(id: 1))
			XCTAssertNotNil(pokeAPILocal.encounterCondition(id: 1))
			XCTAssertNotNil(pokeAPILocal.encounterConditionValue(id: 1))
			XCTAssertNotNil(pokeAPILocal.encounterMethod(id: 1))
			XCTAssertNotNil(pokeAPILocal.evolutionChain(id: 1))
			XCTAssertNotNil(pokeAPILocal.evolutionTrigger(id: 1))
			XCTAssertNotNil(pokeAPILocal.generation(id: 1))
			XCTAssertNotNil(pokeAPILocal.pokedex(id: 1))
			XCTAssertNotNil(pokeAPILocal.version(id: 1))
			XCTAssertNotNil(pokeAPILocal.versionGroup(id: 1))
			XCTAssertNotNil(pokeAPILocal.item(id: 1))
			XCTAssertNotNil(pokeAPILocal.itemAttribute(id: 1))
			XCTAssertNotNil(pokeAPILocal.itemCategory(id: 1))
			XCTAssertNotNil(pokeAPILocal.itemFlingEffect(id: 1))
			XCTAssertNotNil(pokeAPILocal.itemPocket(id: 1))
			XCTAssertNotNil(pokeAPILocal.location(id: 1))
			XCTAssertNotNil(pokeAPILocal.locationArea(id: 1))
			XCTAssertNotNil(pokeAPILocal.palParkArea(id: 1))
			XCTAssertNotNil(pokeAPILocal.region(id: 1))
			XCTAssertNotNil(pokeAPILocal.machine(id: 1))
			XCTAssertNotNil(pokeAPILocal.move(id: 1))
			XCTAssertNotNil(pokeAPILocal.moveAilment(id: 1))
			XCTAssertNotNil(pokeAPILocal.moveBattleStyle(id: 1))
			XCTAssertNotNil(pokeAPILocal.moveCategory(id: 1))
			XCTAssertNotNil(pokeAPILocal.moveDamageClass(id: 1))
			XCTAssertNotNil(pokeAPILocal.moveLearnMethod(id: 1))
			XCTAssertNotNil(pokeAPILocal.moveTarget(id: 1))
			XCTAssertNotNil(pokeAPILocal.ability(id: 1))
			XCTAssertNotNil(pokeAPILocal.characteristic(id: 1))
			XCTAssertNotNil(pokeAPILocal.eggGroup(id: 1))
			XCTAssertNotNil(pokeAPILocal.gender(id: 1))
			XCTAssertNotNil(pokeAPILocal.growthRate(id: 1))
			XCTAssertNotNil(pokeAPILocal.nature(id: 1))
			XCTAssertNotNil(pokeAPILocal.pokeathlonStat(id: 1))
			XCTAssertNotNil(pokeAPILocal.pokemon(id: 1))
			XCTAssertNotNil(pokeAPILocal.pokemonColor(id: 1))
			XCTAssertNotNil(pokeAPILocal.pokemonForm(id: 1))
			XCTAssertNotNil(pokeAPILocal.pokemonHabitat(id: 1))
			XCTAssertNotNil(pokeAPILocal.pokemonShape(id: 1))
			XCTAssertNotNil(pokeAPILocal.pokemonSpecies(id: 1))
			XCTAssertNotNil(pokeAPILocal.stat(id: 1))
			XCTAssertNotNil(pokeAPILocal.type(id: 1))
			XCTAssertNotNil(pokeAPILocal.language(id: 1))
		} catch {
			XCTFail(error.localizedDescription)
		}
	}
	
	static var allTests = [
		("testPokeAPILocal", testPokeAPILocal)
	]
}
