//
//  AuthResponse.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/5/24.
//

import Foundation

struct AuthResponse: Codable {
    var user: UserData
    var token: TokenData
    
    private enum CodingKeys: String, CodingKey {
        case token = "token"
        case user = "user"
    }
}
