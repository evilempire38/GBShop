//
//  EndpointTypeProtocol.swift
//  GBShop
//
//  Created by Андрей Коноплёв on 04.04.2022.
//

import Foundation

protocol EndpointTypeProtocol {
    var path : String { get set }
}

extension EndpointTypeProtocol {
    var url : URL? {
        return URLComponents(string: path)?.url
    }
}
