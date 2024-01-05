//
//  TokenData.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/5/24.
//

import Foundation

struct TokenData: Codable {
    let tokenType: String
    let expiresIn: Int
    let accessToken, refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
