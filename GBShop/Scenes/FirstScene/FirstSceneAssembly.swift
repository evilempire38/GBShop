//
//  FirstSceneAssembly.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum FirstSceneAssembly {
    static func build() -> UIViewController {
        let presenter = FirstScenePresenter()
        let worker = FirstSceneWorker()
        let interactor = FirstSceneInteractor(presenter: presenter, worker: worker)
        let router = FirstSceneRouter(dataStore: interactor)
        let viewController = FirstSceneViewController(interactor: interactor, router: router)

        presenter.viewController = viewController
        router.viewController = viewController

        return viewController
    }
}
