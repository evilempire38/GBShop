//
//  FeedbacksSceneAssembly.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum FeedbacksSceneAssembly {
    static func build() -> UIViewController {
        let presenter = FeedbacksScenePresenter()
        let worker = FeedbacksSceneWorker()
        let interactor = FeedbacksSceneInteractor(presenter: presenter, worker: worker)
        let router = FeedbacksSceneRouter(dataStore: interactor)
        let viewController = FeedbacksSceneViewController(interactor: interactor, router: router)

        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
