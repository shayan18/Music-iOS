//
//  AlbumListReducer.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import ComposableArchitecture
import Foundation
import Microya

let albumListReducer = AnyReducer<AlbumListState, AlbumListAction, AppEnv>() { state, action, env in
    switch action {
    case .didAppear:
        return env.apiProvider
            .publisher(on: .getAlbums, decodeBodyTo: [Album].self)
            .receive(on: env.mainQueue)
            .catchToEffect()
            .cancellable(id: Cancellable(), cancelInFlight: true)
            .map { AlbumListAction.receivedAlbumResponse($0) }
        
    case .filteredAlbumsUpdateRequestedViaSearchText:
        if state.searchText.isEmpty {
            state.searchedAlbums = state.albums
        } else {
            state.searchedAlbums =  state.albums.filter { $0.album.lowercased().contains(state.searchText) || $0.artist.lowercased().contains(state.searchText) ||
                $0.tracks.joined().lowercased().contains(state.searchText)
            }
        }

    case let .searchTextChanged(searchedText):
        state.searchText = searchedText.trimmingCharacters(in: .whitespaces).lowercased()
        return .init(value: .filteredAlbumsUpdateRequestedViaSearchText)
        
    case let .receivedAlbumResponse(albumResponse):
        switch albumResponse {
        case let .success(response):
            return .merge(
                .init(value: .albumsSortedAccending(response)),
                .init(value: .filteredAlbumsUpdateRequestedViaSearchText)
            )
            
        case let .failure(error):
            state.errorMessage = error.localizedDescription
        }
        
    case let .albumsSortedAccending(albums):
        state.albums = albums.sorted { $0.album.alphanumeric < $1.album.alphanumeric }
    }
    return .none
}
