//
//  AddToCartModel.swift
//  NeoProductApp
//
//  Created by Neo on 26/07/24.
//

import Foundation

struct AddToCartModel: Codable{
    var product_id: Int
    var quantity: Int
}

struct AddToCartResponse: Codable{
    var status: Int
    var data: Int
    var total_carts: Int
    var message: Int
    var user_msg: Int
}
