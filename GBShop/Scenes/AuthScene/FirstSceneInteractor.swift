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
        worker.auth(request, username: "Somebody", password: "password") { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success): self?.presenter.presentInitForm(success)
                case.failure(_): return
                }
            }
        }
    }
}
