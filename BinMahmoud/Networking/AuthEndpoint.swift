//
//  AuthEndpoint.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 12/12/2020.
//

import Foundation
import UIKit

enum AuthEndpoint : Endpoint {
    
    case videos(seach: String, languageId: Int , categoryId : Int)
    case uploadFile(image : Data)
    case categories(search : String, languageId: Int)
    
    var path: String {
        switch self {
        case .videos(_,_ , _):
            return "/videos"
        case .uploadFile(_):
            return "files"
        case .categories(_, _):
            return "/categories"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .videos(_,_ , _):
            return .get
        case .categories(_, _):
            return .get
        case .uploadFile(_) :
            return .post
        }
    }
    var contentType: HTTPContentType {
        switch self {
        case .uploadFile(_) :
            return .multipart
        case .videos(_,_ , _):
            return .form
        case .categories(_ , _):
            return .form
        default:
            return .json
        }
    }
    
    var query: HTTPParameters {
        var query = HTTPParameters()
        switch self {
        case .videos(let search, let languageId, let categoryId):
            query["search"] = search
            query["language_id"] = languageId
            query["category_id"] = categoryId
        case .categories(let search, let languageId):
            query["search"] = search
            query["language_id"] = languageId
        default:
            break
        }
        return query
    }
    
    var body: HTTPParameters {
        var body = HTTPParameters()
        
        switch self {
        case .videos(let search, let languageId, let categoryId):
            body["search"] = search
            body["language_id"] = languageId
            body["category_id"] = categoryId
        case .categories(let search, let languageId):
            body["search"] = search
            body["language_id"] = languageId
        default:
            break
        }
        return body
    }
    var multipart: [HTTPMultipart] {
        var multipart: [HTTPMultipart] = []
        switch self {
        case .uploadFile( let image):
            multipart.append(HTTPMultipart(key: "file", filename: "file.png", data: image, mimeType: "image/png"))
        default:
            break
        }
        return multipart
    }
}
