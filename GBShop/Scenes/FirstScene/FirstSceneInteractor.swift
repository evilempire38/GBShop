//
//  FirstSceneInteractor.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class FirstSceneInteractor: FirstSceneBusinessLogic, FirstSceneDataStore {
    private let presenter: FirstScenePresentationLogic
    private let worker: FirstSceneWorkerLogic

    init(
        presenter: FirstScenePresentationLogic,
        worker: FirstSceneWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: FirstScene.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(FirstScene.InitForm.Response())
        }
    }
}
