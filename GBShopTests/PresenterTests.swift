//
//  PresenterTests.swift
//  GBShopTests
//
//  Created by Андрей Коноплёв on 08.04.2022.
//

import Foundation
import XCTest
@testable import GBShop

final class PresenterTests : XCTestCase {
    func testPresentInitForm() {
        let presenter = FirstScenePresenter()
        let mockViewController = FirstSceneVCMock()
        presenter.viewController = mockViewController
        let responseMock : FirstScene.InitForm.Response = makeResponseMock()
        presenter.presentInitForm(responseMock)
        
        XCTAssertTrue(mockViewController.viewModel?.name == "Boss", "Имя дожно быть Boss")
        XCTAssertTrue(mockViewController.viewModel?.lastname == "Boss Milkdrinker", "Имя должно быть Boss Milkdrinker")
        
    }
    private func makeResponseMock() -> FirstScene.InitForm.Response {
        return .init(result: 202, user: .init(idUser: 323123, userLogin: "Boss123", userName: "Boss", userLastname: "Boss Milkdrinker"), authToken: "token")
    }
}
