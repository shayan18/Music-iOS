//
//  AlbumListView.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import ComposableArchitecture
import SwiftUI

struct AlbumListView: View {
    let store: Store<AlbumListState, AlbumListAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            NavigationView {
                ZStack(alignment: .leading) {
                    ScrollView(.vertical) {
                        ForEach(viewStore.searchedAlbums, id: \.id) { album in
                            AlbumView(state: .init(name: album.name, artistName: album.artist, trackTitle: album.tracks.first ?? "", url: album.imageUrl))
                        }
                        .searchable(text: viewStore.binding(get: \.searchText, send: AlbumListAction.searchTextChanged))
                    }
                }
                .onAppear {
                    viewStore.send(.didAppear)
                }
            }
        }
    }
}


