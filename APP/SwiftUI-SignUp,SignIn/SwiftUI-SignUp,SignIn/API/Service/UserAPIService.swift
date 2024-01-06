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
        return APIClient.shared.session
            .request(UserRouter.fetchCurrentUserInfo)
            .publishDecodable(type: UserInfoResponse.self)
            .value()
            .map { recivedValue in
                return recivedValue.user
            }.eraseToAnyPublisher()
    }
}
