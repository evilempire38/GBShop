//
//  GoodsScenePresenter.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class GoodsScenePresenter: GoodsScenePresentationLogic {
    weak var viewController: GoodsSceneDisplayLogic?

    func presentInitForm(_ response: [GoodsScene.InitForm.Response]) {
        let viewModel = response.map { value in
            GoodsScene.InitForm.ViewModel(param: value)
        }
        viewController?.displayInitForm(viewModel)
    }
}
