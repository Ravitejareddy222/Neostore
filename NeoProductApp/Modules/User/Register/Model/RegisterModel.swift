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
    var phone_no: String
}

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
    let phone_no: String?
    let dob: String?
    let is_active: Bool?
    let created: String?
    let modified: String?
    let access_token: String?
}


//struct ErrorResponse1: Codable {
//    let status: Int
//    let message: String
//    let userMsg: String
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case message
//        case userMsg = "user_msg"
//    }
//}
//
//struct ErrorResponse2: Codable {
//    let status: Int
//    let data: UserData
//    let message: String
//    let userMsg: String
//
//    struct UserData: Codable {
//        let firstName: String
//        let lastName: String
//        let email: String
//        let gender: String
//        let phoneNo: Int
//
//        enum CodingKeys: String, CodingKey {
//            case firstName = "first_name"
//            case lastName = "last_name"
//            case email
//            case gender
//            case phoneNo = "phone_no"
//        }
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case data
//        case message
//        case userMsg = "user_msg"
//    }
//}
