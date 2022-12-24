//
//  CatalogCurator.swift
//  MusadoraKit
//
//  Created by Rudrank Riyam on 10/04/22.
//

import MusicKit

@available(iOS 15.4, macOS 12.3, tvOS 15.4, watchOS 9.0, *)
public extension MCatalog {
  /// Fetch a curator from the Apple Music catalog by using its identifier.
  /// - Parameters:
  ///   - id: The unique identifier for the curator.
  ///   - properties: Additional relationships to fetch with the curator.
  /// - Returns: `Curator` matching the given identifier.
  static func curator(for id: MusicItemID, with properties: CuratorProperties) async throws -> Curator {
    var request = MusicCatalogResourceRequest<Curator>(matching: \.id, equalTo: id)
    request.properties = properties
    let response = try await request.response()

    guard let curator = response.items.first else {
      throw MusadoraKitError.notFound(for: id.rawValue)
    }
    return curator
  }

  /// Fetch a curator from the Apple Music catalog by using its identifier with all properties.
  /// - Parameters:
  ///   - id: The unique identifier for the curator.
  /// - Returns: `Curator` matching the given identifier.
  static func curator(for id: MusicItemID) async throws -> Curator {
    var request = MusicCatalogResourceRequest<Curator>(matching: \.id, equalTo: id)
    request.properties = .all
    let response = try await request.response()

    guard let curator = response.items.first else {
      throw MusadoraKitError.notFound(for: id.rawValue)
    }
    return curator
  }

  /// Fetch multiple curators from the Apple Music catalog by using their identifiers.
  /// - Parameters:
  ///   - ids: The unique identifiers for the curators.
  ///   - properties: Additional relationships to fetch with the curators.
  /// - Returns: `Curators` matching the given identifiers.
  static func curators(for ids: [MusicItemID], with properties: CuratorProperties) async throws -> Curators {
    var request = MusicCatalogResourceRequest<Curator>(matching: \.id, memberOf: ids)
    request.properties = properties
    let response = try await request.response()
    return response.items
  }

  /// Fetch multiple curators from the Apple Music catalog by using their identifiers with all properties.
  /// - Parameters:
  ///   - ids: The unique identifiers for the curators.
  /// - Returns: `Curators` matching the given identifiers.
  static func curators(for ids: [MusicItemID]) async throws -> Curators {
    var request = MusicCatalogResourceRequest<Curator>(matching: \.id, memberOf: ids)
    request.properties = .all
    let response = try await request.response()
    return response.items
  }
}
