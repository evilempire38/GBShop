//
//  GoodsSceneRouter.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class GoodsSceneRouter: GoodsSceneRoutingLogic, GoodsSceneDataPassing {
    weak var viewController: UIViewController?
    let dataStore: GoodsSceneDataStore

    init(dataStore: GoodsSceneDataStore) {
        self.dataStore = dataStore
    }
}

private extension GoodsSceneRouter {
//    func passDataTo_() {
//        source: GoodsSceneDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
