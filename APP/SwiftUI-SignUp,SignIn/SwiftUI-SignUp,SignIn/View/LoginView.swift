//
//  LoginView.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/4/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    @State private var shouldShowAlert: Bool = false
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("이메일", text: $emailInput)
                    TextField("비밀번호", text: $passwordInput)
                } header: {
                    Text("로그인 정보")
                }
                
                Section {
                    TextField("이메일", text: $emailInput)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    SecureField("비밀번호", text: $passwordInput)
                        .keyboardType(.default)
                } header: {
                   Text("로그인 정보")
                }
                
                Button {
                    print("로그인 버튼 클릭")
                    userViewModel.login(email: emailInput, password: passwordInput)
                } label: {
                    Text("로그인 하기")
                }
            }
            .onReceive(userViewModel.loginSuccess, perform: { _ in
                print("loginView - registrationSuccess() called")
                self.shouldShowAlert = true
            })
            .alert("로그인이 완료되었습니다.", isPresented: $shouldShowAlert) {
                Button("확인", role: .cancel) {
                    self.dismiss()
                }
            }
        }.navigationTitle("로그인 하기")
    }
}

#Preview {
    LoginView()
}
