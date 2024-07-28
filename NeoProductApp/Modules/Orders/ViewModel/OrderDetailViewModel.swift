//
//  OrderDetailViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 26/07/24.
//

import Foundation

class OrderDetailsViewModel{
  
    var orderDetailResponse: OrderDetailResponse?
    var orderData: OrderData?
    var allProducts: [ProductDetail] = []

    func getOrderDetails(orderId: Int , completion: @escaping (Error?) -> Void) {
    
        let urlString = Constants.orderDetailUrl
        var urlComponents = URLComponents(string: urlString)!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "order_id", value: "\(orderId)")
        ]
        guard let url = urlComponents.url else {
            return
        }
        
        NetworkManager.shared.getData(url: url){ [weak self] (statusCode, response: OrderDetailResponse?, error: Error?) in
            
            guard let self = self else { return }
            
            if let error = error {
                completion(error)
                return
            }
            
            if let response = response{
                 orderData = response.data
                completion(nil)
            }
        }
    }
    
    func getProductName(item: Int) -> String{
        print(orderData?.order_details[item].prod_name ?? "")
        return orderData?.order_details[item].prod_name ?? ""
    }
    func getProductImage(item: Int) -> String {
            guard let details = orderData?.order_details, item < details.count else {
                return ""
            }
            return details[item].prod_image
        }
      
    func getProductCategory(item: Int) -> String{
        print(orderData?.order_details[item].prod_cat_name ?? "")
        return orderData?.order_details[item].prod_cat_name ?? ""
    }
    
    func getProductCost(item: Int) -> Int{
        return orderData?.order_details[item].total ?? 0
    }
    func getProductQuantity(item: Int) -> Int{
        return orderData?.order_details[item].quantity ?? 0
    }
    func getOrderTotalCost() -> Int {
        return orderData?.cost ?? 0
    }
    func getTotalCount() -> Int{
        let totalCount = orderData?.order_details.count ?? 0
        return totalCount + 1
    }
}
