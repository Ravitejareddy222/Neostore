//
//  NetworkManager.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//

import Foundation

class DetailsManager{
    
    static let detailsManager = DetailsManager()
    //var productDetails: [ProductDetails?] = []
    
    func getProductDetails(){
        guard let url = URL(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getDetail?product_id=19") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error as? NSError {
                if error.domain == NSURLErrorDomain && error.code == NSURLErrorSecureConnectionFailed {
                    print("SSL connection failed: \(error.localizedDescription)")
                } else {
                    print("Error fetching data: \(error.localizedDescription)")
                }
                return
            }
            
            guard let responseData = data else{
                print("data received ok")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("invalid response")
            }
           
            do{
                let response = try? JSONDecoder().decode(ProductData.self, from: data ?? Data())
                print("yrs", response)
            } catch{
                print("Error decoding JSON: \(error.localizedDescription)")

            }
            
        }
        task.resume()
    }
}
