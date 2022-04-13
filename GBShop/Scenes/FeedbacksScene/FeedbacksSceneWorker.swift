//
//  FeedbacksSceneWorker.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

final class FeedbacksSceneWorker: FeedbacksSceneWorkerLogic, NetworkSessionProtocol {
    func deleteFeedBack(_ request: FeedbacksScene.DeleteFeedBack.Request, completion: @escaping (Result<FeedbacksScene.DeleteFeedBack.Response, NetworkError>) -> Void) {
        let endpoint : EndpointTypeProtocol = EndPointForDeleteFeedBack()
        let completionWrapper : (Result<FeedbacksScene.DeleteFeedBack.Response, NetworkError>) -> Void = { result in
            switch result {
            case .success(let success) : completion(.success(success))
            case .failure(_) : completion(.failure(.invalidID))
            }
        }
        network(endpoint: endpoint, completion: completionWrapper)
    }
    
    func addFeedback(_ request: FeedbacksScene.AddFeedBack.Request, completion: @escaping (Result<FeedbacksScene.AddFeedBack.Response, NetworkError>)-> Void) {
        let endpoint : EndpointTypeProtocol = EndPointForFeedback()
        let ccompletionWrapper : (Result<FeedbacksScene.AddFeedBack.Response, NetworkError>) -> Void = { result in
            switch result {
            case .success(let success) : completion(.success(success))
            case .failure(_): completion(.failure(.badrequest))
            }
        }
        
        network(endpoint: endpoint, completion: ccompletionWrapper)
    }
    
    var session: URLSession
    init(session : URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
}
private struct EndPointForFeedback : EndpointTypeProtocol {
    var path: String = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/addReview.json"
}
private struct EndPointForDeleteFeedBack : EndpointTypeProtocol {
    var path: String = "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/removeReview.json"
}
