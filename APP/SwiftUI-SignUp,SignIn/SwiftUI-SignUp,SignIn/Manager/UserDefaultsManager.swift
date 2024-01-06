//
//  UserDefaultsManager.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/6/24.
//

import Foundation

class UserDefaultsManager {
    
    enum Key: String, CaseIterable {
        case refreshToken, accessToken
    }
    
    static let shared: UserDefaultsManager = {
        return UserDefaultsManager()
    }()
    
    func clearAll() {
       print("userDefaultsManager - clearAll() called")
        Key.allCases.forEach {
            UserDefaults.standard.removeObject(forKey: $0.rawValue)
        }
    }
    
    func setTokens(accessToken: String, refreshToken: String) {
        print(#function, "is Called")
        UserDefaults.standard.set(accessToken, forKey: Key.accessToken.rawValue)
        UserDefaults.standard.set(refreshToken, forKey: Key.refreshToken.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getTokens() -> TokenData {
        let accessToken = UserDefaults.standard.string(forKey: Key.accessToken.rawValue)
        let refreshToken = UserDefaults.standard.string(forKey: Key.refreshToken.rawValue)
        return TokenData(accessToken: accessToken ?? "", refreshToken: refreshToken ?? "")
    }
}
