//
//  CartDeleteViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 28/07/24.
//

import Foundation
class CartDeleteViewModel{
    
    var dict: [String: Any] = [ : ]
    
    func deleteCart(product_id: Int, completion: @escaping (Error?) -> Void){
        let urlString = Constants.deleteCartUrl
        guard let url = URL(string: urlString) else { return }
        
        dict["product_id"] = product_id
        
        NetworkManager.shared.postData(url: url, dict: dict) { [weak self] (statusCode, response: DeleteCartResponse?, error: Error?) in
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
