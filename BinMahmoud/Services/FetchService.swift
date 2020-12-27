//
//  ServiceConfiguration.swift
//  BinMahmoud
//
//  Created by Asad Ullah on 10/12/2020.
//

import Foundation

enum Response<T> {
    case success(T)
    case failure(Error)
}

protocol DataFetcher {
    
    typealias responseHandler<T> = (Response<T>) -> Void
    func fetch<T>(apiEndPoint: Endpoint,isHeader : Bool, response: @escaping responseHandler<T>) where T: Codable
}

struct FetchService: DataFetcher {
    let networking: Networking
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func fetch<T>(apiEndPoint: Endpoint,isHeader : Bool, response: @escaping responseHandler<T>) where T: Codable {
        
        self.networking.request(from: apiEndPoint, isHeader: isHeader){ data, error in
            if let error = error {
                response(.failure(error))
                return
            }
            guard let decoded = self.decodeJSON(type: T.self, from: data) else { response(.failure(error?.localizedDescription as! Error))
                return
            }
            response(.success(decoded))
                    
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()

        guard let data = from,
              let response = try? decoder.decode(type.self, from: data) else { return nil }

        return response
        

    }
}



