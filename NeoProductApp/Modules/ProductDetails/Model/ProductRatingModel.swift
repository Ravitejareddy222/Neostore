//
//  ProductRatingModel.swift
//  NeoProductApp
//
//  Created by Neo on 28/07/24.
//

import Foundation

struct ProductRatingResponse: Codable{
    let status: Int
    let data: ProductRatingData
    var message: String
    var user_msg: String
}

struct ProductRatingData: Codable{
    
}
