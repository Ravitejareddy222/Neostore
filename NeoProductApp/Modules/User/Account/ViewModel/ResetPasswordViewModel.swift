//
//  ResetPasswordViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 23/07/24.
//

import Foundation

class ResetPasswordViewModel{
    var resetPassword: ResetPasswordParameters?
    var resetResponse: ResetResponse?
    var dict: [String: Any] = [ : ]
    
    func resetUserPassword(with parameters: ResetPasswordParameters, completion: @escaping (Error?) -> Void){
        let urlString = Constants.changePasswordUrl
        guard let url = URL(string: urlString) else { return }
        resetPassword = parameters
        dict["old_password"] = resetPassword?.old_password
        dict["password"] = resetPassword?.password
        dict["confirm_password"] = resetPassword?.confirm_password
        
        print(dict)
       
        NetworkManager.shared.postData(url: url, dict: dict) { [weak self]  (statusCode, response: ResetResponse?, error: Error?) in
            guard let self = self else{ return }

            if let error = error {
                completion(error)
            }

            if let response = response {
                self.resetResponse = response
                completion(nil)
                
            } else{

            }
        }
    }
    
    func getStatusCode() -> Int{
        return resetResponse?.status ?? 0
    }
}
