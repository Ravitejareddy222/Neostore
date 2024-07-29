import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func getData<T:Decodable>(url: URL, completion: @escaping (Int?, T?, Error?) -> Void) {
        let accessToken = AccessTokenManager.shared.getAccessToken()
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        request.setValue("\(accessToken)", forHTTPHeaderField: "access_token")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, nil, NSError(domain: "InvalidResponse", code: 0, userInfo: nil))
                return
            }
            
            guard (200...401).contains(httpResponse.statusCode) else {
                completion(httpResponse.statusCode, nil, NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: nil))
                return
            }
            
            guard let data = data else {
                completion(httpResponse.statusCode, nil, NSError(domain: "NoData", code: 0, userInfo: nil))
                return
            }
            
            if let data = data as? Data, let dataString = String(data: data, encoding: .utf8) {
                print("ResponseData: \(dataString)")
            }
            
            do {
                let decoder = JSONDecoder()
                if let responseData = try decoder.decode(T.self, from: data) as? T {
                    completion(httpResponse.statusCode, responseData, nil)
                    print(responseData)
                }
            } catch {
                completion(httpResponse.statusCode, nil, error)
            }
        }.resume()
        
    }
    
    func postData<T:Decodable>(url: URL, dict: [String: Any], completion: @escaping (Int?, T?, Error?) -> Void) {
        
        let accessToken = AccessTokenManager.shared.getAccessToken()
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let postDataString = dict.map { key, value in
            return "\(key)=\(value)"
        }.joined(separator: "&")
        
        request.httpBody = postDataString.data(using: .utf8)
        request.setValue("\(accessToken)", forHTTPHeaderField: "access_token")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, nil, NSError(domain: "InvalidResponse", code: 0, userInfo: nil))
                return
            }
            
            guard (200...404).contains(httpResponse.statusCode) else {
                completion(httpResponse.statusCode, nil, NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: nil))
                return
            }
            
            guard let data = data else {
                completion(httpResponse.statusCode, nil, NSError(domain: "NoData", code: 0, userInfo: nil))
                return
            }
            
            if let data = data as? Data, let dataString = String(data: data, encoding: .utf8) {
                print("ResponseData: \(dataString)")
            }
            
            do {
                let decoder = JSONDecoder()
                if let responseData = try decoder.decode(T.self, from: data) as? T {
                    completion(httpResponse.statusCode, responseData, nil)
                    print("yes")
                    print(responseData)
                }
            } catch {
                completion(httpResponse.statusCode, nil, error)
            }
        }.resume()
        
    }
}
