//
//  MyCartViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 26/07/24.
//

import Foundation

class MyCartViewModel{
    
    var cartData: [CartData]? = []
    var productData: ProductData?
    var cartResponse: MyCartResponse?
    
    func getCartList(completion: @escaping (Error?) -> Void) {
        
        let urlString = Constants.getCartListUrl
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.getData(url: url){ [weak self] (statusCode, response: MyCartResponse?, error: Error?) in
            
            guard let self = self else { return }
            
            if let error = error {
                completion(error)
                return
            }
            
            if let response = response{
                self.cartResponse = response
                self.cartData = response.data
                completion(nil)
            }
        }
    }
    
    func getProductId(item: Int) -> Int{
        return cartResponse?.data[item].product_id ?? 0
    }
    
    func getProductName(item: Int) -> String{
        return cartResponse?.data[item].product.name ?? ""
    }
    func getProductImage(item: Int) -> String{
        return cartResponse?.data[item].product.product_images ?? ""
    }
    func getProductCategory(item: Int) -> String{
        return cartResponse?.data[item].product.product_category ?? ""
    }
    func getProductCost(item: Int) -> Int{
        return cartResponse?.data[item].product.cost ?? 0
    }
    func getProductQuantity(item: Int) -> Int{
        if let cartItem = cartResponse?.data[item]{
            return cartItem.quantity
        }
        return 0
    }
    func getCartTotalCost() -> Int {
        return cartResponse?.total ?? 0
    }
    func getTotalCount() -> Int{
        let totalCount = (cartResponse?.count ?? 0) + 2
        return totalCount
    }
    
    
    
}
