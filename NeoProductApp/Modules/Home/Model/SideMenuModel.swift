//
//  SideMenuModel.swift
//  NeoProductApp
//
//  Created by Neo on 28/07/24.
//

import Foundation
import UIKit

enum MenuItem: Int, CaseIterable {
    case myCart
    case tables
    case sofas
    case chairs
    case cupboards
    case myAccount
    case storeLocator
    case myOrders
    case logout
    
    var title: String {
        switch self {
        case .myCart: return "MyCart"
        case .tables: return "Tables"
        case .sofas: return "Sofas"
        case .chairs: return "Chairs"
        case .cupboards: return "Cupboards"
        case .myAccount: return "My Account"
        case .storeLocator: return "Store Locator"
        case .myOrders: return "My Orders"
        case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
        case .myCart: return "cart"
        case .tables: return "table"
        case .sofas: return "sofa"
        case .chairs: return "chair"
        case .cupboards: return "cupboard-icon"
        case .myAccount: return "person"
        case .storeLocator: return "locator"
        case .myOrders: return "orders"
        case .logout: return "logout"
        }
    }
}
