//
//  StringExtention.swift
//  Muzik
//
//  Created by Shayan Ali on 31.01.23.
//

import Foundation

extension String {
    var alphanumeric: String {
        return self.components(separatedBy: CharacterSet.alphanumerics.inverted).joined().lowercased()
    }
}
