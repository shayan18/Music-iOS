//
//  ApiProviderExt.swift
//  Muzik
//
//  Created by Shayan Ali on 31.01.23.
//

import Foundation
import Microya
@testable import Muzik

extension ApiProvider {
  static var test: ApiProvider<AlbumEndPoint> {
    ApiProvider<AlbumEndPoint>(
      baseUrl: URL(string: "https://1979673067.rsc.cdn77.org")!,
      plugins: [],
      mockingBehavior: .init(
        delay: TestConstants.requestDelay,
        scheduler: TestConstants.scheduler.eraseToAnyScheduler(),
        mockedResponseProvider: { endpoint in
          switch endpoint {
          case .getAlbums:
              return endpoint.mock(status: .ok, mockedJson: .albums)
          }
        }
      )
    )
  }
}


extension AlbumEndPoint {
  func mock(
    status: HttpStatus,
    mockedJson: MockedJson? = nil,
    headers: [String: String] = [:]
  ) -> MockedResponse {
    guard let mockedJson = mockedJson else {
      return mock(status: status, bodyJson: nil, headers: headers)
    }

    let bodyJson = try! String(data: Data(mockedJson: mockedJson), encoding: .utf8)
    return mock(status: status, bodyJson: bodyJson, headers: headers)
  }
}
