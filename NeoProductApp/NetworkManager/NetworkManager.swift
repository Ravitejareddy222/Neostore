import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    func connectNetwork<T:Decodable>(url: URL, method: String, completion: @escaping (T?, Error?) -> Void) {

        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, NSError(domain: "InvalidResponse", code: 0, userInfo: nil))
                return
            }

            guard let data = data else {
                completion(nil, NSError(domain: "NoData", code: 0, userInfo: nil))
                return
            }

            do {
                let decoder = JSONDecoder()
                if let responseData = try decoder.decode(T.self, from: data) as? T {
                    completion(responseData, nil)
                    print(responseData)
                }
            } catch {
                completion(nil, error)
            }
        }.resume()

    }
    
    
}
