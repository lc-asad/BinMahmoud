//
//  NetworkService.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 10/12/2020.
//

import Foundation

protocol Networking {
    typealias CompletionHandler = (Data?, Swift.Error?) -> Void
    
    func request(from: Endpoint,isHeader : Bool, completion: @escaping CompletionHandler)
}

struct HTTPNetworking: Networking {

    func request(from: Endpoint,isHeader : Bool, completion: @escaping CompletionHandler) {
        
        guard let request = createRequest(endpoint: from) else { return }
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createRequest(endpoint: Endpoint) -> URLRequest? {
        
        var components = URLComponents(string: endpoint.fullUrl)
        var queryItems: [URLQueryItem] = []
        for item in endpoint.query {
            queryItems.append(URLQueryItem(name: item.key, value: item.value as? String))
        }
        components?.queryItems = queryItems
        guard let url = components?.url else { return nil}
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        return request
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping CompletionHandler) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, httpResponse, error in
            completion(data, error)
        }
    }
}
