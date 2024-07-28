//
//  OrderDetailsViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 26/07/24.
//

import Foundation

struct ProductDetail: Codable {
    let id: Int
    let order_id: Int
    let product_id: Int
    let quantity: Int
    let total: Int
    let prod_name: String
    let prod_cat_name: String
    let prod_image: String
}


struct OrderData: Codable {
    let id: Int
    let cost: Int
    let address: String
    let order_details: [ProductDetail]
}


struct OrderDetailResponse: Codable {
    let status: Int
    let data: OrderData
}
