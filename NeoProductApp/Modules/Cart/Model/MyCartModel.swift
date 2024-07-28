//
//  MyCartModel.swift
//  NeoProductApp
//
//  Created by Neo on 26/07/24.
//

import Foundation

struct MyCartResponse: Codable {
    var status: Int
    var data: [CartData]
    var count: Int
    var total: Int
}

struct CartData: Codable{
    var id: Int
    var product_id: Int
    var quantity: Int
    var product: ProductData
}

struct ProductData: Codable{
    var id: Int
    var name: String
    var cost: Int
    var product_category: String
    var product_images: String
    var sub_total: Int
}
