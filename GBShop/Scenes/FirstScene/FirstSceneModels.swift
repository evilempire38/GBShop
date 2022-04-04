//
//  FirstSceneModels.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum FirstScene {
    enum InitForm {
        struct Request {}
        struct Response: Codable {
                let result: Int
                let user: User
                let authToken: String
           
            struct User: Codable {
                let idUser: Int
                let userLogin, userName, userLastname: String
               
               enum CodingKeys : String, CodingKey {
                   case idUser = "id_user"
                   case userLogin = "user_login"
                   case userName = "user_name"
                   case userLastname = "user_lastname"
               }
           }
        }
        struct ViewModel {
            let name : String
            let lastname : String
            init(param: FirstScene.InitForm.Response){
                self.name = param.user.userName
                self.lastname = param.user.userLastname
            }
        }
    }
}

