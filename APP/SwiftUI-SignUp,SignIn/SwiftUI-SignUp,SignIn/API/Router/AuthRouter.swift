//
//  AuthRouter.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/5/24.
//

import Foundation
import Alamofire

enum AuthRouter: URLRequestConvertible {
    case register(name: String, email: String, password: String)
    case login(email: String, password: String)
    case tokenRefresh
    
    var baseURL: URL {
        return URL(string: APIClient.BASE_URL)!
    }

    var endPoint: String {
        switch self {
        case .register(let name, let email, let password):
            return "/user/register"
        case .login(let email, let password):
            return "/user/login"
        case .tokenRefresh:
            return "/user/token-refresh"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .tokenRefresh, .register : return .post
        }
    }
    
    var paramters: Parameters {
        switch self {
        case .register(let name, let email, let password):
            var parm = Parameters()
            parm["name"] = name
            parm["email"] = email
            parm["password"] = password
            return parm
        case .login(let email, let password):
            var parm = Parameters()
            parm["email"] = email
            parm["password"] = password
            return parm
        case .tokenRefresh:
            var parm = Parameters()
            // parm["refresh_token"] = " "
            return parm
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = method
        
        request.httpBody = try JSONEncoding.default.encode(request, with: paramters).httpBody
        
        return request
    }
}
