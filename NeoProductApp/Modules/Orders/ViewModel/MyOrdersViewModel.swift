//
//  MyOrdersViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 26/07/24.
//

import Foundation

class MyOrdersViewModel{
    
    var myOrders: [OrdersData] = []
    var myOrdersResponse: MyOrdersResponse?
    
    func getMyOrders(completion: @escaping (Error?) -> Void) {
        
        let urlString = Constants.orderListUrl
        guard let url = URL(string: urlString) else { return }
        
        NetworkManager.shared.getData(url: url){ [weak self] (statusCode, response: MyOrdersResponse?, error: Error?) in
            
            guard let self = self else { return }
            
            if let error = error {
                completion(error)
                return
            }
            
            if let response = response{
                self.myOrdersResponse = response
                self.myOrders = response.data
                completion(nil)
            }
        }
    }
    
    func getOrderDate(item: Int) -> String{
        return myOrders[item].created
    }
    
    func getOrderId(item: Int) -> Int{
        return myOrders[item].id
    }
    
    func getOrderCost(item: Int) -> Int{
        return myOrders[item].cost
    }
    
    func getTableViewCellCount() -> Int{
        return myOrders.count
    }
}
