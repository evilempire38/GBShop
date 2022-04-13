//
//  FirstSceneVCMock.swift
//  GBShopTests
//
//  Created by Андрей Коноплёв on 08.04.2022.
//

import Foundation
import XCTest

@testable import GBShop

final class FirstSceneVCMock: FirstSceneDisplayLogic {
    var displayInitFormWasCalled : Bool = false
    var viewModel : FirstScene.InitForm.ViewModel?
    func displayInitForm(_ viewModel: FirstScene.InitForm.ViewModel) {
        displayInitFormWasCalled = true
        self.viewModel = viewModel
        
    }
    
}
