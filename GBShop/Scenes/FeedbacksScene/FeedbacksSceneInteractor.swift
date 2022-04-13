//
//  FeedbacksSceneInteractor.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class FeedbacksSceneInteractor: FeedbacksSceneBusinessLogic, FeedbacksSceneDataStore {
    private let presenter: FeedbacksScenePresentationLogic
    private let worker: FeedbacksSceneWorkerLogic

    init(
        presenter: FeedbacksScenePresentationLogic,
        worker: FeedbacksSceneWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }
    func requestAddFeedback(_ request: FeedbacksScene.AddFeedBack.Request) {
        worker.addFeedback(request) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success) : self?.presenter.addFeedback(success)
                case .failure(_): return
                }
            }
        }
    }
    func requestDeleteFeedback(_ request: FeedbacksScene.DeleteFeedBack.Request) {
        worker.deleteFeedBack(request) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success) :
                    self?.presenter.deleteFeedback(success)
                    print(success.result)
                case .failure(_) : return
                }
            }
        }
    }
}
