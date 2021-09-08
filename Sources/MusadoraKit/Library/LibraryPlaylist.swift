//
//  LibraryPlaylist.swift
//  LibraryPlaylist
//
//  Created by Rudrank Riyam on 14/08/21.
//

import MusicKit

public extension AppleMusicEndpoint {
    static var libraryPlaylists: Self {
        AppleMusicEndpoint(library: .user, "/library/playlists")
    }
}

public extension MusadoraKit {
    static func libraryPlaylists() async throws -> Playlists {
        try await self.decode(endpoint: .libraryPlaylists)
    }
}
