//
//  JSONDecoderExt.swift
//  MuzikTests
//
//  Created by Shayan Ali on 31.01.23.
//

import Foundation

extension JSONDecoder {
    /// The JSONDecoder for responses received from the album API.
    public static var albumApi: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
