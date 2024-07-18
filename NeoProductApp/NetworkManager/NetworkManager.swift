import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchDataFromAPI(product_category_id: Int, completion: @escaping (Result<[Product], Error>) -> Void) {
        
        var components = URLComponents(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getList")
        components?.queryItems = [
            URLQueryItem(name: "product_category_id", value: "\(product_category_id)")
        ]
        
        guard let url = components?.url else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(NSError(domain: "InvalidResponse", code: 0, userInfo: nil)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "NoData", code: 0, userInfo: nil)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let productResponse = try decoder.decode(ProductResponse.self, from: data)
                completion(.success(productResponse.data))
                print(productResponse)
            } catch {
                completion(.failure(error))
            }
        }.resume()
        
    }
}
