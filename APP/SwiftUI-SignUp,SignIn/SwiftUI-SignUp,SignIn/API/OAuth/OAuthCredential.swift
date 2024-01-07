//
//  OAuthCredential.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/7/24.
//

import Foundation
import Alamofire

struct OAuthCredential: AuthenticationCredential {
    let accessToken: String
    let refreshToken: String
    let expiration: Date
    var requiresRefresh: Bool { Date(timeIntervalSinceNow: 60 * 5) > expiration}
}
