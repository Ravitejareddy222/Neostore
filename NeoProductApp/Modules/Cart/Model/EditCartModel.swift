//
//  EditCartModel.swift
//  NeoProductApp
//
//  Created by Neo on 28/07/24.
//

import Foundation

struct EditCartResponse: Codable{
    var status: Int
    var data: Int
    var total_carts: Int
    var message: Int
    var user_msg: Int
}
