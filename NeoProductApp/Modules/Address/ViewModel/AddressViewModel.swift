//
//  AddressViewModel.swift
//  NeoProductApp
//
//  Created by Neo on 26/07/24.
//

import Foundation

class AddressViewModel{
  
    var addressArray: [Any] = []

    func getAddressList() -> [Any]{
        addressArray = UserDefaults.standard.array(forKey: "MyAddressList") ?? []
        return addressArray
    }
    
    func getTableViewCellCount() -> Int{
        return addressArray.count+1
    }
    
}
