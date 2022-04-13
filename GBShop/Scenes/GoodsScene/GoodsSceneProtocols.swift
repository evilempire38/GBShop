//
//  GoodsSceneProtocols.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol GoodsSceneDataPassing {
    var dataStore: GoodsSceneDataStore { get }
}

protocol GoodsSceneDataStore {}

protocol GoodsSceneBusinessLogic {
    func requestInitForm(_ request: GoodsScene.InitForm.Request)
}

protocol GoodsSceneWorkerLogic {
    func getAllGoods(_ request : GoodsScene.InitForm.Request, completion: @escaping (Result<[GoodsScene.InitForm.Response], NetworkError>)-> Void)
}

protocol GoodsScenePresentationLogic {
    func presentInitForm(_ response: [GoodsScene.InitForm.Response])
}

protocol GoodsSceneDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: [GoodsScene.InitForm.ViewModel])
}

protocol GoodsSceneRoutingLogic {}
