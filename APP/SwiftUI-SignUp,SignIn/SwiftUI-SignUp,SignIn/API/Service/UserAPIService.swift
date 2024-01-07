//
//  UserAPIService.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/6/24.
//

import Foundation
import Alamofire
import Combine

// 인증관련 API 호출
enum UserAPIService {

    static func fetchCurrentUserInfo() -> AnyPublisher<UserData, AFError> {
        
        let storedTokenData = UserDefaultsManager.shared.getTokens()
        let credential = OAuthCredential(accessToken: storedTokenData.accessToken, refreshToken: storedTokenData.refreshToken, expiration: Date(timeIntervalSinceNow: 60 * 60))
        let authenticator = OAuthAuthenticatior()
        let interceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                    credential: credential)
        
        return APIClient.shared.session
            .request(UserRouter.fetchCurrentUserInfo, interceptor: interceptor)
            .publishDecodable(type: UserInfoResponse.self)
            .value()
            .map { recivedValue in
                return recivedValue.user
            }.eraseToAnyPublisher()
    }
    
    static func fetchUsers() -> AnyPublisher<[UserData], AFError> {
        
        let storedTokenData = UserDefaultsManager.shared.getTokens()
        let credential = OAuthCredential(accessToken: storedTokenData.accessToken, refreshToken: storedTokenData.refreshToken, expiration: Date(timeIntervalSinceNow: 60 * 60))
        let authenticator = OAuthAuthenticatior()
        let interceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                    credential: credential)
        
        return APIClient.shared.session
            .request(UserRouter.fetchUsers, interceptor: interceptor)
            .publishDecodable(type: UserListResponse.self)
            .value()
            .map { recivedValue in
                return recivedValue.data
            }.eraseToAnyPublisher()
    }
}
