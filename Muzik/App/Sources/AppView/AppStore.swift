//
//  AppStore.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import Foundation

struct AppState: Equatable {
    var albumListState: AlbumListState?
}

enum AppAction: Equatable {
case didAppear
case albumList(action: AlbumListAction)
}
