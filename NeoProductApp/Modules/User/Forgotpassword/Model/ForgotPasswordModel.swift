//
//  ForgotPasswordModel.swift
//  NeoProductApp
//
//  Created by Neo on 23/07/24.
//

import Foundation

struct ForgotPasswordParameter: Codable{
    var email: String
}

struct ForgotPasswordResponse: Codable{
    var status: Int
    var message: String
    var user_msg: String
}
