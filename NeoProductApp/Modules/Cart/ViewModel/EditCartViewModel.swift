//
//  EditCartViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 28/07/24.
//

import Foundation

class EditCartViewModel{
    var dict: [String: Any] = [ : ]
    
    func editCart(product_id: Int, productQuantity: Int, completion: @escaping (Error?) -> Void){
        let urlString = Constants.editCartUrl
        guard let url = URL(string: urlString) else { return }
        
        dict["product_id"] = product_id
        dict["quantity"] = productQuantity
        
        NetworkManager.shared.postData(url: url, dict: dict) { [weak self] (statusCode, response: EditCartResponse?, error: Error?) in
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
