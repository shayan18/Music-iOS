//
//  AppView.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import ComposableArchitecture
import SwiftUI

struct AppView: View {
    let store: Store<AppState, AppAction>
    
    var body: some View {
        WithViewStore(store) { viewStore in
            Group {
                IfLetStore(
                    store.scope(
                        state: \.albumListState,
                        action: AppAction.albumList(action:)
                    ),
                    then: AlbumListView.init(store:)
                )
            }
            .onAppear {
                viewStore.send(.didAppear)
              }
        }
    }
}
