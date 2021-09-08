//
//  MusadoraKit.swift
//  MusadoraKit
//
//  Created by Rudrank Riyam on 04/08/21.
//

import MusicKit
import Foundation

public class MusadoraKit {
    static func decode<Model: Decodable>(endpoint: AppleMusicEndpoint) async throws -> Model {
        let url = await endpoint.url()
        let dataRequest = MusicDataRequest(urlRequest: URLRequest(url: url))
        let dataResponse = try await dataRequest.response()
        
        let decoder = JSONDecoder()
        
        let response = try decoder.decode(Model.self, from: dataResponse.data)
        
        return response
    }
}
