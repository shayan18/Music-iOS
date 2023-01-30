//
//  AppEnvExt.swift
//  Muzik
//
//  Created by Shayan Ali on 31.01.23.
//

@testable import Muzik
import Foundation

extension AppEnv {
    static let test: Self = .init(
    mainQueue: DispatchQueue.test.eraseToAnyScheduler(),
    apiProvider: .test)
}
