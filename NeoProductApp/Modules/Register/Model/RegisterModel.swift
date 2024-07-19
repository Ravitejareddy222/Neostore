//
//  RegisterModel.swift
//  NeoProductApp
//
//  Created by Neo on 19/07/24.
//

import Foundation

struct UserResponse: Codable {
    let status: Int
    let data: UserData
    let message: String
    let user_msg: String
}

struct UserData: Codable {
    let id: Int?
    let role_id: Int?
    let first_name: String?
    let last_name: String?
    let email: String?
    let username: String?
    let profile_pic: String?
    let country_id: Int?
    let gender: String?
    let phone_no: Int?
    let dob: String?
    let is_active: Bool?
    let created: String?
    let modified: String?
    let access_token: String?
}
