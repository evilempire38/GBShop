//
//  GoodsSceneWorker.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class GoodsSceneWorker: GoodsSceneWorkerLogic, NetworkSessionProtocol {
    func getAllGoods(_ request: GoodsScene.InitForm.Request, completion: @escaping (Result<[GoodsScene.InitForm.Response], NetworkError>) -> Void) {
        let endpoint : EndpointTypeProtocol = EndPointForGoods()
        let competionWrapper : (Result<[GoodsScene.InitForm.Response],NetworkError>) -> Void = { result in
            switch result {
            case .success(let success) : completion(.success(success))
            case .failure(_) : completion(.failure(.invalidURL))
            }
        }
        network(endpoint: endpoint, completion: competionWrapper)
    }
    
    var session: URLSession
    init(session : URLSession = URLSession(configuration: .default)){
        self.session = session
    }
    
    
    
}
private struct EndPointForGoods : EndpointTypeProtocol {
    var path : String = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/catalogData.json"
}
