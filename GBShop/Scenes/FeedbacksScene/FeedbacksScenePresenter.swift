//
//  FeedbacksScenePresenter.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class FeedbacksScenePresenter: FeedbacksScenePresentationLogic {
    weak var viewController: FeedbacksSceneDisplayLogic?

    func addFeedback(_ response: FeedbacksScene.AddFeedBack.Response) {
        let viewModel = FeedbacksScene.AddFeedBack.ViewModel(paramers: response)
        viewController?.showFeedBackMessage(viewModel)
    }
    func deleteFeedback(_ response: FeedbacksScene.DeleteFeedBack.Response) {
        let viewModel = FeedbacksScene.DeleteFeedBack.ViewModel(param: response)
        viewController?.showDeleteMessage(viewModel)
        
        
    }
}
