import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchDataFromAPI(completion: @escaping (Result<[Product], Error>) -> Void) {
        let urlString = "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1&limit=10&page=1"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0, userInfo: nil)))
            return
        }
        let parameters: [String: Any] = [
            "product_category_id": 0,
            "limit": 10,
            "page": 1
        ]
        
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.httpBody = jsonData
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
        }catch {
            print("Error creating JSON data: \(error)")
        }
    }
}
