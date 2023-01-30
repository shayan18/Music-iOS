//
//  MuzikTests.swift
//  MuzikTests
//
//  Created by Shayan Ali on 30.01.23.
//

import ComposableArchitecture
import XCTest
@testable import Muzik

final class AlbumViewTests: XCTestCase {
    func testAppView() {
        let appStore = TestStore(
            initialState: .init(),
            reducer: appReducer,
            environment: .test
        )
        
        appStore.send(.didAppear) {
            $0.albumListState = .init()
        }
    }
}
