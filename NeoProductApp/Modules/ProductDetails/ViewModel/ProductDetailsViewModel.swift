//
//  ProductDetailsViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import Foundation

class ProductDetailsViewModel{
    
    var productDetails: ProductDetails?
    
    func getProductDetails(product_id: Int, completion: @escaping (Error?) -> Void){
        let urlString = Constants.productDetailUrl
        var urlComponents = URLComponents(string: urlString)!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "product_id", value: "\(product_id)")
        ]
        guard let url = urlComponents.url else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to create URL"])
            completion(error)
            return
        }
        NetworkManager.shared.getData(url: url) { [weak self] (statusCode, response: ProductDetailsResponse?, error: Error?) in
            guard let self = self else { return }
            
            if let error = error {
                completion(error)
                return
            }
            
            if let response = response {
                self.productDetails = response.data
                completion(nil)
            } else {
                let error = NSError(domain: "NoData", code: 0, userInfo: nil)
                completion(error)
            }
        }
    }
    
    func getProductCategoryName() -> String{
        var category = ""
        switch productDetails?.product_category_id {
        case 1:
             category = "Category -Tables"
        case 2:
            category = "Category -Chairs"
        case 3:
            category =  "Category -Sofa"
        case 4:
            category =  "Category -cupboards"
        default:
            break
        }
        return category
    }
    
    func getProductId() -> Int{
        return productDetails?.id ?? 0
    }
    
    func getRatings() -> Int{
        print(productDetails?.rating ?? 0)
        return productDetails?.rating ?? 0
    }
    
    func getProductName() -> String{
        return productDetails?.name ?? ""
    }
    
    func getProductImage() -> String? {
        if let url = productDetails?.product_images.first?.image {
            return url.absoluteString
        }
        return nil
    }
    
 }


