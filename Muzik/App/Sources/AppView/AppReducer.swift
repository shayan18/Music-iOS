//
//  AppReducer.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import ComposableArchitecture

let appReducer = AnyReducer.combine(
    albumListReducer
    .optional()
    .pullback(
      state: \AppState.albumListState,
      action: /AppAction.albumList(action:),
      environment: { $0 }
    ),
    AnyReducer<AppState, AppAction, AppEnv>() { state, action, env in
    switch action {
    case .didAppear:
        state.albumListState = .init()
        
    case .albumList(action: let action):
        break
    }
    return .none
}
)
    
