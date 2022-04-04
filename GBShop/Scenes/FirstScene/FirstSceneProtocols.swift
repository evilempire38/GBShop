//
//  FirstSceneProtocols.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol FirstSceneDataPassing {
    var dataStore: FirstSceneDataStore { get }
}

protocol FirstSceneDataStore {}

protocol FirstSceneBusinessLogic {
    func requestInitForm(_ request: FirstScene.InitForm.Request)
}

protocol FirstSceneWorkerLogic {
    func auth(_ request: FirstScene.InitForm.Request, username : String, password : String, completion: @escaping (Result<FirstScene.InitForm.Response, NetworkError>) -> Void)
}

protocol FirstScenePresentationLogic {
    func presentInitForm(_ response: FirstScene.InitForm.Response)
}

protocol FirstSceneDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: FirstScene.InitForm.ViewModel)
}

protocol FirstSceneRoutingLogic {}
