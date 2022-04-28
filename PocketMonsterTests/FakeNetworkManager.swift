//
//  FakeNetworkManager.swift
//  PocketMonsterTests
//
//  Created by Sukanya Yanamala on 26/04/2022.
//

import Foundation
@testable import PocketMonster


class FakeNetworkmanager: NetworkManager {
    
    var data: Data?
    
    override func getResponseType<ResponseType: Decodable>(_ type: ResponseType.Type) async throws -> ResponseType {
       
        switch "\(type)" {
        case "PokemonResponse" :
            let data = try await getPokemonResponseData()
            let result = try JSONDecoder().decode(ResponseType.self, from: data)
            return result
        case "PokemonDetails" :
            let data = try await getPokemonDetailsData()
            let result = try JSONDecoder().decode(ResponseType.self, from: data)
            return result
        default:
            let data = try await getDefaultData()
            let result = try JSONDecoder().decode(ResponseType.self, from: data)
            return result
        }
   
            
      
      
   }
    
    func getPokemonResponseData() async throws -> Data {
        let data = try getDataFrom(jsonFile: "pocketmonster_response_success")
        return data

    }
    
    func getPokemonDetailsData() async throws -> Data {
        let data = try getDataFrom(jsonFile: "pocketmonster_details_success")
        return data
    }
    
    func getDefaultData() async throws -> Data {
        let data = try getDataFrom(jsonFile: "default")
        return data
    }
    
    private func getDataFrom(jsonFile: String) throws -> Data {
        let bundle = Bundle(for: PocketMonsterTests.self)
        guard let url = bundle.url(forResource: jsonFile, withExtension: "json")
        else { return Data() }
        return try Data(contentsOf: url)
    }
    
}

