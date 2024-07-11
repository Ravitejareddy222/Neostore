//
//  NetworkManager.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    var products: [Product] = []
    var jsonDict: [[String: Any]] = []
    
    //var productList: [Products?] = []
//    var header: [String:String] {
//            var dict:[String:String]
//            dict = [contentKey:contentValue_Post]
//            return dict
//        }
    func apiCall() {
        guard let url = URL(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1&limit=10&page=1") else{
             print("invalid URL")
            //completion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { (data, error, response) in
            if let error = error as? NSError {
                if error.domain == NSURLErrorDomain && error.code == NSURLErrorSecureConnectionFailed {
                    print("SSL connection failed: \(error.localizedDescription)")
                } else {
                    print("Error fetching data: \(error.localizedDescription)")
                }
                return
            }
            guard let data = data else{
                return
            }
            //print(String(data: data, encoding: .utf8) ?? "Data is not UTF-8")
            do {
                let response = try JSONDecoder().decode(ProductResponse.self, from: data)
                self.products = response.data
                 //print("Products: \(self.products)")

            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}
