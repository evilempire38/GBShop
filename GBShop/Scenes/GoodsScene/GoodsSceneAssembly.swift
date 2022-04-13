//
//  GoodsSceneAssembly.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum GoodsSceneAssembly {
    static func build() -> UIViewController {
        let presenter = GoodsScenePresenter()
        let worker = GoodsSceneWorker()
        let interactor = GoodsSceneInteractor(presenter: presenter, worker: worker)
        let router = GoodsSceneRouter(dataStore: interactor)
        let viewController = GoodsSceneViewController(interactor: interactor, router: router)

        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
