//
//  PokemonResponse.swift
//  PocketMonster
//
//  Created by Sukanya Yanamala on 4/20/22.
//

import Foundation

struct PokemonResponse: Decodable {
    let results: [Pokemon]
}
