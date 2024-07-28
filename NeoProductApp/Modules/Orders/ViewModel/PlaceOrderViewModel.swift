//
//  PlaceOrderViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 26/07/24.
//

import Foundation

class PlaceOrderViewModel{
    var dict: [String: Any] = [ : ]
    func placeOrder(address: String, completion: @escaping (Error?) -> Void){
        let urlString = Constants.orderUrl
        guard let url = URL(string: urlString) else{ return }
        
        dict["address"] = address
        
        NetworkManager.shared.postData(url: url, dict: dict) { [weak self] (statusCode, response: PlaceOrderResponse?, error: Error?) in
            guard let self = self else { return }
            
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
