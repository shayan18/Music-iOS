//
//  TestConstants.swift
//  Muzik
//
//  Created by Shayan Ali on 31.01.23.
//

import ComposableArchitecture
import Foundation

enum TestConstants {
    /// The delay to put on API requests returning a result.
    static let requestDelay: DispatchQueue.SchedulerTimeType.Stride = .milliseconds(300)
    
    /// The test scheduler to control time in tests.
    static let scheduler: TestScheduler = DispatchQueue.test
}
