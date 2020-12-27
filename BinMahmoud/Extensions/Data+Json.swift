//
//  Data+Json.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 26/12/2020.
//

import Foundation

extension Data {
    func toObject<T:Codable>(_ type: T.Type) -> T? {
        if type == VoidResponse.self {
            return VoidResponse() as? T
        }
        return try? Json.decoder.decode(type, from: self)
    }
}
