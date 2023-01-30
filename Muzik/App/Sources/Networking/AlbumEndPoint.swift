//
//  AlbumEndPoint.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import Foundation
import Microya

/// The collection of supported endpoints of the Album domain
enum AlbumEndPoint {
    /// Request to get world news.
    case getAlbums
}

extension AlbumEndPoint: Endpoint {    
    typealias ClientErrorType = AlbumError

    var headers: [String : String] {
        [:]
    }

    var subpath: String {
        switch self {
        case .getAlbums:
            return "/music-albums.json"
        }
    }

    var method: HttpMethod {
        switch self {
        case .getAlbums:
            return .get
        }
    }

    var decoder: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }
}


