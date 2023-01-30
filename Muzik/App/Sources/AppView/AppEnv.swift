//
//  AppEnv.swift
//  Muzik
//
//  Created by Shayan Ali on 30.01.23.
//

import ComposableArchitecture
import Foundation
import Microya

struct AppEnv {
  let mainQueue: AnySchedulerOf<DispatchQueue>
  let apiProvider: ApiProvider<AlbumEndPoint>
}
