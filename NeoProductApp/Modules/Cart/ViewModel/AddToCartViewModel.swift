//
//  AddToCartViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 25/07/24.
//

import Foundation

class AddToCartViewModel{
    var dict: [String: Any] = [ : ]
    func addToCart(product_id: Int, productQuantity: Int, completion: @escaping (Error?) -> Void){
        let urlString = Constants.addToCartUrl
        guard let url = URL(string: urlString) else { return }
        
        dict["product_id"] = product_id
        dict["quantity"] = productQuantity
        
        NetworkManager.shared.postData(url: url, dict: dict) { [weak self] (statusCode, response: AddToCartResponse?, error: Error?) in
            guard let self = self else{return}
            
            if let error = error{
                completion(error)
                return
            }
            
            if let response = response{
                completion(nil)
            }
        }
        
    }
    
    
}
