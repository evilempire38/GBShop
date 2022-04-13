//
//  FirstSceneWorker.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class FirstSceneWorker: FirstSceneWorkerLogic, NetworkSessionProtocol {
    
    func auth(_ request: FirstScene.InitForm.Request,
              username: String,
              password: String,
              completion: @escaping (Result<FirstScene.InitForm.Response, NetworkError>) -> Void) {
        let endPoint : EndpointTypeProtocol = EndPoint()
        let completionWrapper : (Result<FirstScene.InitForm.Response, NetworkError>) -> Void = { result in
            switch result {
            case .success(let success) : completion(.success(success))
            case .failure(_): completion(.failure(.invalidURL))
            }
        }
        network(endpoint: endPoint, completion: completionWrapper)
    }
    var session: URLSession
    init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
}
private struct EndPoint : EndpointTypeProtocol {
    var path : String = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json"
}
