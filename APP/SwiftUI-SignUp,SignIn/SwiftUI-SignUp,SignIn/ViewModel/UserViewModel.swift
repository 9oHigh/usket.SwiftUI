//
//  UserViewModel.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/6/24.
//

import Foundation
import Alamofire
import Combine

class UserViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    @Published var loggedInUser: UserData? = nil
    var registrationSuccess = PassthroughSubject<(), Never>()
    var loginSuccess = PassthroughSubject<(), Never>()
    
    // 회원가입
    func register(name: String, email: String, password: String) {
        print("userViewModel register() called")
        AuthAPIService
            .register(name: name, email: email, password: password)
            .sink { completion in
                print("userViewModel completion: ", completion)
            } receiveValue: { userData in
                self.registrationSuccess.send()
            }.store(in: &subscription)
    }
    
    // 로그인
    func login(email: String, password: String) {
        print("userViewModel login() called")
        AuthAPIService
            .login(email: email, password: password)
            .sink { completion in
                print("userViewModel completion: ", completion)
            } receiveValue: { userData in
                self.loggedInUser = userData
                 self.loginSuccess.send()
            }.store(in: &subscription)
    }
}
