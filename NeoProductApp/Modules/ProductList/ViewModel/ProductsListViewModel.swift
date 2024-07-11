//
//  ProductsListViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import Foundation

class ProductsListViewModel {
    
    var products: [Product?] = []
    
    func getUserDetails(){
       
        NetworkManager.shared.apiCall()
        print(products)
    }
}
