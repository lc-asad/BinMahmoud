//
//  Json.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 26/12/2020.
//

import Foundation

enum Json {
    static let encoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    
    static let decoder = JSONDecoder()
}
