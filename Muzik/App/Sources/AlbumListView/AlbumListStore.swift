//
//  AlbumListStore.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import ComposableArchitecture
import Microya

struct AlbumListState: Equatable {
    var albums: [Album] = []
    var searchedAlbums: [Album] = []
    var searchText: String = ""
    var errorMessage: String = ""
}

enum AlbumListAction: Equatable {
    case didAppear
    case receivedAlbumResponse(Result<[Album], ApiError<AlbumError>>)
    case searchTextChanged(String)
    case filteredAlbumsUpdateRequestedViaSearchText
    case albumsSortedAccending([Album])
}
