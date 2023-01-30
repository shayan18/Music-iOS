//
//  AlbumResponse.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import Foundation

/// The attributes of a Album object including track list.
struct Album: Decodable, Identifiable, Equatable {
    /// The unique identifier for the given object. Required.
    let id: String
    
    /// The name of the music album.
    let album: String
    
    /// The name of the artist that produces the album.
    let artist: String
    
    /// The cover picture of the album.
    let cover: String
    
    let label: String
    
    /// The list of tracks in the album.
    let tracks: [String]
    
    /// The year the album launched.
    let year: String
    
    /// Computed Album property for more readibility
    var name: String {
        "Album: \(album)"
    }
    
    var imageUrl: URL? {
        URL(string: cover)
    }
}
