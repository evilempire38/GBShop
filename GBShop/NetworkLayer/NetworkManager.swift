//
//  NetworkManager.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//

import Foundation
protocol EndpointTypeProtocol {
    var path : String { get set}
}

protocol NetworkSessionProtocol {
    func network<Success:Decodable>(endpoint : EndpointTypeProtocol, completion: @escaping (Result<Success,NetworkError>)-> Void)
    var session : URLSession { get set }
}
extension EndpointTypeProtocol {
    var url : URL? {
        return URLComponents(string: path)?.url
    }
}
extension NetworkSessionProtocol {
    func network<Success:Decodable>(endpoint : EndpointTypeProtocol, completion: @escaping (Result<Success,NetworkError>)-> Void) {
        guard let endpoint = endpoint.url else {
            completion(.failure(.badrequest))
            return
        }
        let task = session.dataTask(with: endpoint) { data, response, error in
            if let data = data {
                do {
                    let myData = try JSONDecoder().decode(Success.self, from: data)
                    completion(.success(myData))
                } catch {
                    completion(.failure(.badrequest))
                    return
                }
            } else {
                completion(.failure(.badrequest))
                return
            }
        }
        task.resume()
    }
}

enum NetworkError: Error {
    case badrequest
    case invalidURL
    case invalidID
    case invalidToken
    
}
