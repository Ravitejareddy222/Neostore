//
//  ProductsListViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//


import Foundation

class ProductsListViewModel {
    
    var products: [Product] = []
    
    func fetchProducts(product_category_id: Int, completion: @escaping (Error?) -> Void) {
        
        let urlString = Constants.productListUrl
        var urlComponents = URLComponents(string: urlString)!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "product_category_id", value: "\(product_category_id)")
        ]
        guard let url = urlComponents.url else {
            let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to create URL"])
            completion(error)
            return
        }
        NetworkManager.shared.getData(url: url) { [weak self] (statusCode, response: ProductResponse?, error: Error?) in
            guard let self = self else { return }
            
            if let error = error {
                completion(error)
                return
            }
            
            if let response = response {
                self.products = response.data
                completion(nil)
            } else {
                let error = NSError(domain: "NoData", code: 0, userInfo: nil)
                completion(error)
            }
        }
    }
    
    func getCount() -> Int {
        return products.count
    }
    
    func getProduct(at index: Int) -> Product? {
        guard index < products.count else {
            return nil
        }
        return products[index]
    }
    
    func getRatings(item: Int) -> Int{
        return products[item].rating
    }
}
