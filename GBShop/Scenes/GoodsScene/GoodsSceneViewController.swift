//
//  GoodsSceneViewController.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class GoodsSceneViewController: UIViewController, GoodsSceneDisplayLogic {
    private let interactor: GoodsSceneBusinessLogic
    private let router: GoodsSceneRoutingLogic

    init(
        interactor: GoodsSceneBusinessLogic,
        router: GoodsSceneRoutingLogic
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
        createButton()
        
        view.backgroundColor = .systemCyan
    }

    // MARK: - GoodsSceneDisplayLogic

    func displayInitForm(_ viewModel: [GoodsScene.InitForm.ViewModel]) {
        viewModel.forEach { element in
            print(element)
        }
    }

    // MARK: - Private

    @objc private func initForm() {
        interactor.requestInitForm(GoodsScene.InitForm.Request())
    }
    private func createButton() {
        let goodsButton = UIButton()
        goodsButton.setTitle("Got Goods", for: .normal)
        goodsButton.layer.borderColor = UIColor.black.cgColor
        goodsButton.layer.borderWidth = 1
        goodsButton.setTitleColor(.black, for: .normal)
        view.addSubview(goodsButton)
        goodsButton.translatesAutoresizingMaskIntoConstraints = false
        goodsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goodsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        goodsButton.addTarget(self, action: #selector(initForm), for: .touchUpInside)
    }
}
