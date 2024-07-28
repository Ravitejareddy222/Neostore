//
//  ResetPasswordModel.swift
//  NeoProductApp
//
//  Created by Neo on 23/07/24.
//

import Foundation

struct ResetPasswordParameters: Codable{
    var old_password: String
    var password: String?
    var confirm_password: String
}

struct ResetResponse: Codable{
    var status: Int
    var message: String
    var user_msg: String
}
