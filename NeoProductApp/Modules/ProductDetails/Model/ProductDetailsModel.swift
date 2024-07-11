//
//  ProductsListModel.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import Foundation

struct ProductData: Codable {
    let id: Int
    let product_category_id: Int
    let name: String
    let producer: String
    let description: String
    let cost: Int
    let rating: Int
    let view_count: Int
    let created: Date
    let modified: Date
    let product_images: [ProductImage]
}

struct ProductImage: Codable {
    let id: Int
    let product_id: Int
    let image: URL
    let created: Date
    let modified: Date
}

            
