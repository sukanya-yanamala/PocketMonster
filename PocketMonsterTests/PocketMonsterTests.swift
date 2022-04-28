//
//  PocketMonsterTests.swift
//  PocketMonsterTests
//
//  Created by Sukanya Yanamala on 26/04/2022.
//

import XCTest
@testable import PocketMonster

class PocketMonsterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadPokemons_Success() async throws {
       //Given
        _ = FakeNetworkmanager()
        
        let viewModel = PokemonListViewModel(networkManager: FakeNetworkmanager())
        var pokemons: [PokemonData] = []
        
        
        try? await viewModel.loadPokemons()
        viewModel
            .$pokemons
            .sink { result in
                pokemons = result
            }
        
        XCTAssertEqual(pokemons.count, 100)
        
     XCTAssertEqual(pokemons[0].name, "bulbasaur")

        
    }

    
    }


