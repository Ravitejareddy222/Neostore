//
//  EditProfileModel.swift
//  NeoProductApp
//
//  Created by Neo on 28/07/24.
//

import Foundation

struct EditProfileParameters {
    let email: String
    let dob: String
    let profile_pic: String
    let phone_no: String
}

struct EditProfileResponse: Decodable {
    let status: Int
    let data: [EditData]
    let message: String
    let user_msg: String
}

struct EditData: Codable{
    
}
