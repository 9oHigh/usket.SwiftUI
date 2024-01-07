//
//  UserRouter.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/6/24.
//

import Foundation
import Alamofire

enum UserRouter: URLRequestConvertible {
    case fetchCurrentUserInfo
    case fetchUsers
    
    var baseURL: URL {
        return URL(string: APIClient.BASE_URL)!
    }

    var endPoint: String {
        switch self {
        case .fetchUsers:
            return "/user/all"
        case .fetchCurrentUserInfo:
            return "/user/info"
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var paramters: Parameters {
        switch self {
        default:
            var parm = Parameters()
            let tokenData = UserDefaultsManager.shared.getTokens()
            parm["refresh_token"] = tokenData.refreshToken
            return parm
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = method
        
        return request
    }
}

