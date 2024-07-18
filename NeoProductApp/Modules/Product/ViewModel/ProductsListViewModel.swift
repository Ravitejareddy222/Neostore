//
//  ProductsListViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 10/07/24.
//


import Foundation

class ProductsListViewModel {
    
    var products: [Product] = []
    
    func fetchProducts(product_category_id: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        
        NetworkManager.shared.fetchDataFromAPI(product_category_id: product_category_id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let products):
                self.products = products
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
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
}
