//
//  RandomUserRouter.swift
//  SwiftUI-combine
//
//  Created by 이경후 on 12/30/23.
//

import Foundation
import Alamofire

// https://randomuser.me/api/?page=3&results=10&seed=abc
let BASE_URL = "https://randomuser.me/api/"

enum RandomUserRouter: URLRequestConvertible {
    
    case getUsers(page: Int = 1, results: Int = 20)
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var endPoint : String {
        switch self {
        case .getUsers(let page, let results):
            return ""
            // "?page=\(page)&results=\(results)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .getUsers(let page, let results):
            var params = Parameters()
            params["page"] = page
            params["results"] = results
            params["seed"] = "usket"
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = .get
        
        switch self {
        case .getUsers:
            request = try URLEncoding.default.encode(request, with: parameters)
        }
        
        return request
    }
}

