//
//  ResponseMock.swift
//  GBShopTests
//
//  Created by Андрей Коноплёв on 08.04.2022.
//

import Foundation
import XCTest
@testable import GBShop

struct ResponseMock: Codable {
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

