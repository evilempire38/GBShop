//
//  GoodsSceneInteractor.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class GoodsSceneInteractor: GoodsSceneBusinessLogic, GoodsSceneDataStore {
    private let presenter: GoodsScenePresentationLogic
    private let worker: GoodsSceneWorkerLogic

    init(
        presenter: GoodsScenePresentationLogic,
        worker: GoodsSceneWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: GoodsScene.InitForm.Request) {
        worker.getAllGoods(request) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let success) : self?.presenter.presentInitForm(success)
                case.failure(_) : return
                }
            }
        }

    }
}
