//
//  RegisterModel.swift
//  NeoProductApp
//
//  Created by Neo on 19/07/24.
//

import Foundation

struct RegistrationParameters: Codable {
    var first_name: String
    var last_name: String
    var email: String
    var password: String
    var confirm_password: String
    var gender: String
    var phone_no: Int
}

struct UserResponse: Codable {
    let status: Bool
    let data: UserData
    let message: String
    let user_msg: String
    
    enum CodingKeys: String, CodingKey {
            case status
            case data
            case message
            case user_msg = "user_msg"
        }
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
    
    enum CodingKeys: CodingKey {
        case id
        case role_id
        case first_name
        case last_name
        case email
        case username
        case profile_pic
        case country_id
        case gender
        case phone_no
        case dob
        case is_active
        case created
        case modified
        case access_token
    }
}


struct ErrorResponse1: Codable {
    let status: Int
    let message: String
    let userMsg: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case message
        case userMsg = "user_msg"
    }
}

struct ErrorResponse2: Codable {
    let status: Int
    let data: UserData
    let message: String
    let userMsg: String
    
    struct UserData: Codable {
        let firstName: String
        let lastName: String
        let email: String
        let gender: String
        let phoneNo: Int
        
        enum CodingKeys: String, CodingKey {
            case firstName = "first_name"
            case lastName = "last_name"
            case email
            case gender
            case phoneNo = "phone_no"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case status
        case data
        case message
        case userMsg = "user_msg"
    }
}
