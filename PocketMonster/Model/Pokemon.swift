//
//  PokemonForms.swift
//  PocketMonster
//
//  Created by Sukanya Yanamala on 4/20/22.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let urlDetails: String
    enum CodingKeys: String, CodingKey {
        case name
        case urlDetails = "url"
    }
}
