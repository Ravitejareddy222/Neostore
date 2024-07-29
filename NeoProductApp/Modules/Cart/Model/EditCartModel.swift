//
//  EditCartModel.swift
//  NeoProductApp
//
//  Created by Neo on 28/07/24.
//

import Foundation

struct EditCartResponse: Codable{
    var status: Int
    var data: Bool
    var total_carts: Int
    var message: String
    var user_msg: String
}
