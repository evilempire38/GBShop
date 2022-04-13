//
//  FeedbacksSceneRouter.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class FeedbacksSceneRouter: FeedbacksSceneRoutingLogic, FeedbacksSceneDataPassing {
    weak var viewController: UIViewController?
    let dataStore: FeedbacksSceneDataStore

    init(dataStore: FeedbacksSceneDataStore) {
        self.dataStore = dataStore
    }
}

private extension FeedbacksSceneRouter {
//    func passDataTo_() {
//        source: FeedbacksSceneDataStore,
//        destination: inout SomewhereDataStore
//    ) {
//    }
}
