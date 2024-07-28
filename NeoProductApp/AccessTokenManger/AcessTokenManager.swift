//
//  AcessTokenManager.swift
//  NeoProductApp
//
//  Created by Neo on 25/07/24.
//

import Foundation

class AccessTokenManager{
    static let shared = AccessTokenManager()
    private let userDefaults = UserDefaults.standard
    private let accessTokenKey = "AccessTokenKey"
    
    private init() {
        self.accessToken = userDefaults.string(forKey: accessTokenKey) ?? ""
    }
    
    var accessToken: String {
        didSet {
            userDefaults.set(accessToken, forKey: accessTokenKey)
        }
    }
    
    func saveAccessToken(token: String){
       
        self.accessToken = token
    }
    
    func getAccessToken() -> String{
        return accessToken
    }
    
    func deleteAccessToken() {
        self.accessToken = ""
        userDefaults.removeObject(forKey: accessTokenKey)
    }
    
    func isLoggedIn() -> Bool {
        print("........................................................................")
        print(!accessToken.isEmpty)
        return !accessToken.isEmpty
    }
}
