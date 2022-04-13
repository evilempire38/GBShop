//
//  FeedbacksSceneModels.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum FeedbacksScene {
    enum AddFeedBack {
        struct Request {}
        struct Response: Decodable {
            let result: Int
            let userMessage: String
        }
        struct ViewModel {
            let message : String
            init(paramers : AddFeedBack.Response){
                self.message = paramers.userMessage
            }
        }
    }
    enum DeleteFeedBack {
        struct Request {}
        struct Response: Decodable {
            let result: Int
        }
        struct ViewModel {
            let result: Int
            init(param: DeleteFeedBack.Response){
                self.result = param.result
            }
        }
    }
}
