//
//  GoodsSceneModels.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 13.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum GoodsScene {
    enum InitForm {
        struct Request {}
        struct Response: Decodable {
            let idProduct: Int
            let productName: String
            let price: Int

            enum CodingKeys: String, CodingKey {
                case idProduct = "id_product"
                case productName = "product_name"
                case price
            }
        }
        struct ViewModel {
            let idProduct: Int
            let productName: String
            let price: Int
            init(param : GoodsScene.InitForm.Response){
                self.idProduct = param.idProduct
                self.productName = param.productName
                self.price = param.price
            }
        }
    }
}
