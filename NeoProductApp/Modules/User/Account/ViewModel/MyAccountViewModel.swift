//
//  MyAccountViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 25/07/24.
//

import Foundation

class MyAccountViewModel {
    var accessToken = ""
    var fetchedData: FetchData?
    
    func fetchUserDetails(completion: @escaping (Error?) -> Void){
        
        let urlString = Constants.fetchAccountDetailsUrl
        
        guard let url = URL(string: urlString) else{ return }
        
        NetworkManager.shared.getData(url: url) { [weak self]  (statusCode, response: FetchUserResponse?, error: Error?) in
         
            guard let self = self else { return }
            
           if let error = error {
               completion(error)
               return
            }
            
            if let response = response{
                fetchedData = response.data
                print(fetchedData)
                completion(nil)
            }
        }
        
    }
    
    func getFirstName() -> String{
        return fetchedData?.user_data.first_name ?? ""
    }
    func getLastName() -> String{
        return fetchedData?.user_data.last_name ?? ""
    }
    func getEmail() -> String{
        return fetchedData?.user_data.email ?? ""
    }
    func getPhoneNumber() -> String{
        return fetchedData?.user_data.phone_no ?? ""
    }
    func getDOB() -> String{
        return fetchedData?.user_data.dob ?? ""
    }
}
