//
//  APILogger.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/5/24.
//

import Foundation
import Alamofire

class APILogger: EventMonitor {
    
    let queue = DispatchQueue(label: "Oauth_alamofire_tutorial_logger")
    
    func requestDidResume(_ request: Request) {
        print("APILogger - Resuming: \(request)")
    }

    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint("APILogger - Finished: \(response)")
    }
}
