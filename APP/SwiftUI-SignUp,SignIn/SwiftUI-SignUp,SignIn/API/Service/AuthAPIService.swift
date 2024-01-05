//
//  AuthAPIService.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/5/24.
//

import Foundation
import Alamofire
import Combine

// 인증관련 API 호출
enum AuthAPIService {

    static func register(name: String, email: String, password: String) -> AnyPublisher<UserData, AFError> {
        return APIClient.shared.session
            .request(AuthRouter.register(name: name, email: email, password: password))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map { recivedValue in
                return recivedValue.user
            }.eraseToAnyPublisher()
    }
}
