//
//  PocketMonsterApp.swift
//  PocketMonster
//
//  Created by Sukanya Yanamala on 4/20/22.
//

import SwiftUI

@main
struct PocketMonsterApp: App {

    private let viewModel = PokemonListViewModel(networkManager: NetworkManager())
    
    var body: some Scene {
        WindowGroup {
            PokemonListView()
                .environmentObject(viewModel)
        }
    }
}
