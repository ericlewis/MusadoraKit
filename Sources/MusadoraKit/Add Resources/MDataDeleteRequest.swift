//
//  MDataDeleteRequest.swift
//  MusadoraKit
//
//  Created by Rudrank Riyam on 18/05/22.
//

import Foundation
import MusicKit

struct MDataDeleteRequest {
  /// The URL for the data request.
  var url: URL
  
  /// Creates a data request with the given URL.
  init(url: URL) {
    self.url = url
  }
  
  /// Uploads data the Apple Music API endpoint that
  /// the URL request defines.
  func response() async throws -> MusicDataResponse {
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "DELETE"
    
    let request = MusicDataRequest(urlRequest: urlRequest)
    let response = try await request.response()
    return response
  }
}
