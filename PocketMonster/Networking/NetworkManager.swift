//
//  NetworkManager.swift
//  PocketMonster
//
//  Created by Sukanya Yanamala on 4/20/22.
//

import Foundation

 class NetworkManager {
    
    var url: String = ""
    
     func getResponseType<ResponseType: Decodable>(_ type: ResponseType.Type) async throws -> ResponseType {
        let data = try await getData()
        let result = try JSONDecoder().decode(ResponseType.self, from: data)
        return result
    }
    
     func getData() async throws -> Data {
        let url = try createURL()
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
    
    func createURL() throws -> URL {
        guard let url =  URL(string: self.url) else {
            throw NSError(domain: "can not create url", code: 500)
        }
        return url
    }
}
