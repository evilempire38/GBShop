//
//  FirstScenePresenter.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class FirstScenePresenter: FirstScenePresentationLogic {
    weak var viewController: FirstSceneDisplayLogic?

    func presentInitForm(_ response: FirstScene.InitForm.Response) {
        viewController?.displayInitForm(FirstScene.InitForm.ViewModel())
    }
}
