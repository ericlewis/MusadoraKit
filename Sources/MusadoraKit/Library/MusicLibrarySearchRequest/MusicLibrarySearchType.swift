//
//  MusicLibrarySearchType.swift
//  MusicLibrarySearchType
//
//  Created by Rudrank Riyam on 08/09/21.
//

import MusicKit

public enum MusicLibrarySearchType: String, CodingKey {
    case songs = "library-songs"
    case artists = "library-artists"
    case albums = "library-albums"
    case musicVideos = "library-music-videos"
    case playlists = "library-playlists"

    static func getTypes(_ types: [MusicLibrarySearchable.Type]) -> String {
        var typeQueries: [String] = []
        
        for type in types {
            switch type {
                case is Song.Type: typeQueries.append(Self.songs.rawValue)
                case is Album.Type: typeQueries.append(Self.albums.rawValue)
                case is Artist.Type: typeQueries.append(Self.artists.rawValue)
                case is MusicVideo.Type: typeQueries.append(Self.musicVideos.rawValue)
                case is Playlist.Type: typeQueries.append(Self.playlists.rawValue)
                default: ()
            }
        }
        return typeQueries.joined(separator: ",")
    }
}
