//
//  RegisterViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 19/07/24.

import Foundation

class RegisterViewModel{
    var user: RegistrationParameters?
    
    func registerUser(with parameters: RegistrationParameters, completion: @escaping (Error?) -> Void) {
        print(parameters)
        user = parameters
        var dict: [String: Any] = [:]
        
        dict["first_name"] = user?.first_name ?? ""
        dict["last_name"] = user?.last_name ?? ""
        dict["email"] = user?.email ?? ""
        dict["password"] = user?.password ?? ""
        dict["confirm_password"] = user?.confirm_password ?? ""
        dict["gender"] = user?.gender ?? ""
        dict["phone_no"] = user?.phone_no ?? 0
        
        let urlString = Constants.registerUrl
        guard let url = URL(string: urlString) else {
            let error = NSError(domain: "InvalidURL", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            completion(error)
            return
        }
        NetworkManager.shared.postData(url: url, dict: dict) { [weak self] (statusCode, response: UserResponse?, error: Error?) in
            guard let self = self else { return }
            
            if let error = error {
                completion(error)
                return
            }
            
            switch statusCode {
            case 200:
                if let response = response {
                    print("Registration successful: \(response)")
                    completion(nil)
                } else {
                    let error = NSError(domain: "NoData", code: 0, userInfo: nil)
                    completion(error)
                }
            case 400:
                let error = NSError(domain: "BadRequest", code: statusCode ?? 0, userInfo: [NSLocalizedDescriptionKey: "Data missing"])
                completion(error)
            
            default:
                let error = NSError(domain: "UnhandledStatusCode", code: statusCode ?? 0, userInfo: nil)
                completion(error)
            }
        }
    }
    
    func validatePassword(password: String, confirmPassword: String) -> Bool{
        if password == confirmPassword{
            return true
        }
        return false
    }
}
