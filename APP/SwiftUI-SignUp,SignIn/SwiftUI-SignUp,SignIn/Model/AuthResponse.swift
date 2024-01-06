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
    
    enum CodingKeys: String, CodingKey { // 순서대로 입력해줘야함
        case user = "user"
        case token = "token"
    }
}
