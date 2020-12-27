//
//  DataManager.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 26/12/2020.
//

import Foundation

protocol DataManager {
    func get<T>(key: String, type: T.Type) -> T? where T : Codable
    func get(key: String) -> String?
    func set<T>(key: String, value: T?) where T : Codable
    func remove(key: String)
    func clear()
}
