//
//  ProductsListModel.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import Foundation

struct Product: Codable {
    let id: Int
    let product_category_id: Int
    let name: String
    let producer: String
    let description: String
    let cost: Int
    let rating: Int
    let view_count: Int
    let created: String
    let modified: String
    let product_images: URL
}

struct ProductResponse: Codable {
    let status: Int
    let data: [Product]
}
