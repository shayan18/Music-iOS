//
//  DataExt.swift
//  MuzikTests
//
//  Created by Shayan Ali on 31.01.23.
//

import Foundation

extension Data {
  init(
    mockedJson: MockedJson
  ) throws {
    guard
      let jsonFileUrl = Bundle(for: AlbumViewTests.self)
        .url(
          forResource: mockedJson.rawValue,
          withExtension: "json"
        )
    else {
      fatalError("Reading mocked JSON data failed. File expected at: \(mockedJson.rawValue).json")
    }

    self = try Data(contentsOf: jsonFileUrl)
  }
}
