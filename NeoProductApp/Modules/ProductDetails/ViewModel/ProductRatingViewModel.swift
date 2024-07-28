//
//  ProductRatingViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 28/07/24.
//

import Foundation

class ProductRatingViewModel{
    
    var dict: [String: Any] = [ : ]
    
    func setProductRatings(product_id: Int, ratings: Int , completion: @escaping (Error?) -> Void){
        let urlString = Constants.productRatingUrl
        guard let url = URL(string: urlString) else { return }
        dict["product_id"] = product_id
        dict["ratingoptional"] = ratings
    
        NetworkManager.shared.postData(url: url, dict: dict) { [weak self] (statusCode, response: ProductRatingResponse?, error: Error?) in
            guard let self = self else { return }
            
            if let error = error {
                completion(error)
                return
            }
            
            if let response = response {
                print(response)
                completion(nil)
            } else {
                let error = NSError(domain: "NoData", code: 0, userInfo: nil)
                completion(error)
            }
        }
    }
    
}
