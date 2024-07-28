//
//  MyOrdersModel.swift
//  NeoProductApp
//
//  Created by Neo on 26/07/24.
//

import Foundation

struct MyOrdersResponse: Codable{
    var status: Int
    var data: [OrdersData]
}

struct OrdersData: Codable{
    var id: Int
    var cost: Int
    var created: String
}
