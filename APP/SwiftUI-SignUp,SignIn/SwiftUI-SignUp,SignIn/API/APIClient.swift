//
//  APIClient.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/5/24.
//

import Foundation
import Alamofire

final class APIClient {
    
    static let shared = APIClient()
    static let BASE_URL = "https://phplaravel-574671-2229990.cloudwaysapps.com/api"
    
    let interceptors = Interceptor(interceptors: [BaseInterceptor()])
    let monitors = [APILogger()] as [EventMonitor]
    var session: Session
    
    init() {
        print("APIClient - init() called")
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
     
}
