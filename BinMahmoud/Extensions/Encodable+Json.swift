//
//  Encodable+Json.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 26/12/2020.
//

import Foundation

extension Encodable {
    func toJson() -> Data? {
        return try? Json.encoder.encode(self)
    }
}
