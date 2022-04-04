//
//  FirstSceneViewController.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class FirstSceneViewController: UIViewController, FirstSceneDisplayLogic {
    private let interactor: FirstSceneBusinessLogic
    private let router: FirstSceneRoutingLogic

    init(
        interactor: FirstSceneBusinessLogic,
        router: FirstSceneRoutingLogic
    ) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initForm()
    }

    // MARK: - FirstSceneDisplayLogic

    func displayInitForm(_ viewModel: FirstScene.InitForm.ViewModel) {
        print("You just logged in with name \(viewModel.name) \(viewModel.lastname)")
    }

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(FirstScene.InitForm.Request())
    }
}
