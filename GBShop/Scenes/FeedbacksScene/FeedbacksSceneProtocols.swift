//
//  FeedbacksSceneProtocols.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol FeedbacksSceneDataPassing {
    var dataStore: FeedbacksSceneDataStore { get }
}

protocol FeedbacksSceneDataStore {}

protocol FeedbacksSceneBusinessLogic {
    func requestAddFeedback(_ request: FeedbacksScene.AddFeedBack.Request)
    func requestDeleteFeedback(_ request: FeedbacksScene.DeleteFeedBack.Request)
}

protocol FeedbacksSceneWorkerLogic {
    func addFeedback(_ request: FeedbacksScene.AddFeedBack.Request, completion: @escaping (Result<FeedbacksScene.AddFeedBack.Response, NetworkError>)-> Void)
    func deleteFeedBack(_ request: FeedbacksScene.DeleteFeedBack.Request, completion: @escaping (Result<FeedbacksScene.DeleteFeedBack.Response, NetworkError>)-> Void)
}

protocol FeedbacksScenePresentationLogic {
    func addFeedback(_ response: FeedbacksScene.AddFeedBack.Response)
    func deleteFeedback(_ response: FeedbacksScene.DeleteFeedBack.Response)
}

protocol FeedbacksSceneDisplayLogic: AnyObject {
    func showFeedBackMessage(_ viewModel: FeedbacksScene.AddFeedBack.ViewModel)
    func showDeleteMessage(_ viewModel: FeedbacksScene.DeleteFeedBack.ViewModel)
}

protocol FeedbacksSceneRoutingLogic {}
