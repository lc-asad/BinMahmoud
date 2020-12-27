//
//  CategoriesSideMenuModel.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 23/12/2020.
//

import Foundation

struct CategoriesSideMenuResponse: Codable {
   
    var data:[CategoriesSideMenuModel]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}


struct CategoriesSideMenuModel : Codable {
    
    let category_id: Int
    let language_id: Int?
    let type_id: Int?
    let key_id: Int?
    let cat_order: Int?
    let cat_name: String?
    let cat_description: String?
    let cat_type: String?
    let key: String?
    
    enum CodingKeys: String, CodingKey {
        case category_id = "id"
        case language_id = "language_id"
        case type_id = "type_id"
        case key_id = "key_id"
        case cat_order = "cat_order"
        case cat_name = "name"
        case cat_description = "description"
        case cat_type = "type"
        case key = "key"
        
    }
}

