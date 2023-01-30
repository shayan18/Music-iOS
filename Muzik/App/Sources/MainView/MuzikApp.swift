//
//  MusikApp.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import ComposableArchitecture
import SwiftUI
import Microya

@main
struct MuzikApp: App {
    let store: Store<AppState, AppAction>
    let env: AppEnv

    init() {
        let baseUrl: URL = {
          #if DEBUG
            return AppConstants.serverBaseUrl
          #else
            return AppConstants.serverBaseUrl
          #endif
        }()
        
        self.env = AppEnv(
            mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
            apiProvider: ApiProvider<AlbumEndPoint>(
                baseUrl: baseUrl
            ))
        
        self.store = Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: self.env
        )
    }

    var body: some Scene {
        WindowGroup {
            AppView(store: store)
        }
    }
}
