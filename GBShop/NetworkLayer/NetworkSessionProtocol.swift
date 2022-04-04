//
//  NetworkManager.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//

import Foundation


protocol NetworkSessionProtocol {
    func network<Success:Decodable>(endpoint : EndpointTypeProtocol, completion: @escaping (Result<Success,NetworkError>)-> Void)
    var session : URLSession { get set }
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
                    let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                    print(json)
                    let myData = try JSONDecoder().decode(Success.self, from: data)
                    completion(.success(myData))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(.wrongDecoding))
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
    case wrongDecoding
}
