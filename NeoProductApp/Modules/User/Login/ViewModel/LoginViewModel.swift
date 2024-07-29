//
//  LoginViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 23/07/24.
//

import Foundation

class LoginViewModel{
    var userLogin: LoginParams?
    var accessToken = ""
    var statusCode: Int = 0
    var loginData: LoginData?
    
    func loginUser(with params: LoginParams, completion: @escaping (Error?) -> Void){
        userLogin = params
        var dict: [String: Any] = [ : ]
        dict["email"] = userLogin?.email
        dict["password"] = userLogin?.password
        
        let urlString = Constants.loginUrl
        guard let url = URL(string: urlString) else{ return }
        
        NetworkManager.shared.postData(url: url, dict: dict) { [weak self] (statusCode, response: LoginResponse?, error: Error?) in
            
            guard let self = self else { return }
            
            if let error = error{
                completion(error)
                return
            }
            
            if let response = response {
                self.loginData = response.data
                self.accessToken = loginData?.access_token ?? ""
                AccessTokenManager.shared.saveAccessToken(token: accessToken)
                self.statusCode = statusCode ?? 0
                completion(nil)
            }
        }
    }
    
    func getStatusCode() -> Int{
        return statusCode
    }
    func getName() -> String{
        let name = "\(String(describing: loginData?.first_name)) \(String(describing: loginData?.last_name))"
        return name
    }
    func getEmail() -> String{
        return loginData?.email ?? ""
    }
}
