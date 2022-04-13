//
//  FirstSceneRouter.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class FirstSceneRouter: FirstSceneRoutingLogic, FirstSceneDataPassing {
    weak var viewController: UIViewController?
    let dataStore: FirstSceneDataStore
    init(dataStore: FirstSceneDataStore) {
        self.dataStore = dataStore
    }
}

private extension FirstSceneRouter {

}
