//
//  ForgotPasswordViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 23/07/24.
//

import Foundation

class ForgotPasswordViewModel{
    var forgotPassword: ForgotPasswordParameter?
    var forgotPasswordResponse: ForgotPasswordResponse?
    
    var dict: [String: Any] = [ : ]
    
    func sendRequest(email: String, completion: @escaping (Error?) -> Void){
        let urlString = Constants.forgotpasswordUrl
        guard let url = URL(string: urlString) else { return }
        dict["email"] = email
        
        NetworkManager.shared.postData(url: url, dict: dict) { [weak self] (statusCode, response: ForgotPasswordResponse?, error: Error?) in
            
            if let error = error{
                completion(error)
            }
            
            if let response = response{
                self?.forgotPasswordResponse = response
                completion(nil)
            }
        }
        
    }
    
    func getStatusCode() -> Int{
        return forgotPasswordResponse?.status ?? 0
    }
    
}
