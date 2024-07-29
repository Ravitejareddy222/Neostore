//
//  EditProfileViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 25/07/24.
//

import Foundation

class EditProfileViewModel{
    
    var editProfile: EditProfileParameters?
    var dict: [String: Any] = [ : ]
    
    func editProfile(with parameters: EditProfileParameters, completion: @escaping (Error?) -> Void){
        let urlString = Constants.editProfileUrl
        guard let url = URL(string: urlString) else { return }
        editProfile = parameters
        dict["email"] = editProfile?.email
        dict["dob"] = editProfile?.dob
        dict["phone_no"] = editProfile?.phone_no
        dict["profile_pic"] = editProfile?.profile_pic
        
        NetworkManager.shared.postData(url: url, dict: dict) { [weak self]  (statusCode, response: EditProfileResponse?, error: Error?) in
            guard let self = self else{ return }
            
            if let error = error {
                completion(error)
            }
            
            if let response = response {
                completion(nil)
                
            } else{
                
            }
        }
    }
}
