//
//  TokenResponse.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/7/24.
//

import Foundation

struct TokenResponse: Codable {
    let message: String
    let token: TokenData
}
