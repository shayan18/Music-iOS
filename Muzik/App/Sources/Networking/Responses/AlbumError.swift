//
//  AlbumError.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

/// Represents a single error with some additional information on what's wrong.
struct AlbumError: Decodable {
   let errorMessage: String
}
