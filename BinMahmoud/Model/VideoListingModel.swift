//
//  VideoListingModel.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 12/12/2020.
//

import Foundation

struct VideoListingResponse: Codable {
   
    var data:[VideoListingModel]
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

struct VideoListingModel: Codable {

    let vedioId: Int
    let category_id: Int?
    let language_id: Int?
    var title: String?
    var summary: String?
    var short_summary: String?
    var category_title: String?
    var file_name: String?
    var image: String?
    let views: Int?
    let is_youtube: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case vedioId = "id"
        case category_id = "category_id"
        case language_id = "language_id"
        case title = "title"
        case summary = "summary"
        case short_summary = "short_summary"
        case category_title = "category"
        case file_name = "file_name"
        case image = "image"
        case views = "views"
        case is_youtube = "is_youtube"
    }

}

