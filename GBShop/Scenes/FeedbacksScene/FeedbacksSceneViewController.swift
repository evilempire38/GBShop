//
//  FeedbacksSceneViewController.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class FeedbacksSceneViewController: UIViewController, FeedbacksSceneDisplayLogic {
    private let interactor: FeedbacksSceneBusinessLogic
    private let router: FeedbacksSceneRoutingLogic

    init(
        interactor: FeedbacksSceneBusinessLogic,
        router: FeedbacksSceneRoutingLogic
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
        createInterface()
        view.backgroundColor = .systemCyan
        
    }

    // MARK: - FeedbacksSceneDisplayLogic

    func showFeedBackMessage(_ viewModel: FeedbacksScene.AddFeedBack.ViewModel) {
        callMessage(message: viewModel.message, title: "Готово", preferredStyle: .alert)
    }
    func showDeleteMessage(_ viewModel: FeedbacksScene.DeleteFeedBack.ViewModel) {
        callMessage(message: "Отзыв удален", title: "Готово", preferredStyle: .alert)
    }
    

    // MARK: - Private

    @objc private func addFeedBackforGood() {
        interactor.requestAddFeedback(FeedbacksScene.AddFeedBack.Request())
    }
    @objc private func deleteFeedBack() {
        interactor.requestDeleteFeedback(FeedbacksScene.DeleteFeedBack.Request())
    }
    private func createInterface() {
        let feedBackButton = UIButton()
        let deleteFeedBackButton = UIButton()
        let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        feedBackButton.setTitle("Add feedback", for: .normal)
        feedBackButton.layer.borderColor = UIColor.black.cgColor
        feedBackButton.layer.borderWidth = 1
        feedBackButton.setTitleColor(.black, for: .normal)
        feedBackButton.translatesAutoresizingMaskIntoConstraints = false
        deleteFeedBackButton.translatesAutoresizingMaskIntoConstraints = false
        feedBackButton.addTarget(self, action: #selector(addFeedBackforGood), for: .touchUpInside)
        deleteFeedBackButton.setTitle("Delete feedback", for: .normal)
        deleteFeedBackButton.layer.borderColor = UIColor.black.cgColor
        deleteFeedBackButton.layer.borderWidth = 1
        deleteFeedBackButton.setTitleColor(.black, for: .normal)
        deleteFeedBackButton.addTarget(self, action: #selector(deleteFeedBack), for: .touchUpInside)
        stackView.addArrangedSubview(feedBackButton)
        stackView.addArrangedSubview(deleteFeedBackButton)
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    private func callMessage(message : String, title : String, preferredStyle : UIAlertController.Style){
        let ac = UIAlertController(title: title, message: message , preferredStyle: preferredStyle)
        let okAtction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        ac.addAction(okAtction)
        present(ac, animated: true, completion: nil)
    }
}
