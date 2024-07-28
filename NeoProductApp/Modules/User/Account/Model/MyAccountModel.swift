//
//  MyAccountModel.swift
//  NeoProductApp
//
//  Created by Neo on 25/07/24.
//

import Foundation


struct FetchUserResponse: Codable {
    let status: Int
    let data: FetchData
}

struct FetchData: Codable {
    let user_data: User
    let product_categories: [ProductCategory]
    let total_carts: Int
    let total_orders: Int
}

struct User: Codable {
    let id: Int
    let role_id: Int
    let first_name: String
    let last_name: String
    let email: String
    let username: String
    let profile_pic: String? 
    let gender: String
    let phone_no: String
    let dob: String?
    let is_active: Bool
    let created: String
    let modified: String
    let access_token: String
}

struct ProductCategory: Codable {
    let id: Int
    let name: String
    let icon_image: String
    let created: String
    let modified: String
}

