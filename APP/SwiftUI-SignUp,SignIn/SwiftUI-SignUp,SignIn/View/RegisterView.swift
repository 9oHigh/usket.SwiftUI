//
//  RegisterView.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/4/24.
//

import SwiftUI

struct RegisterView: View {
    
    @State var nameInput: String = ""
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    
    var body: some View {
        VStack {
            Form {
                // 이름
                Section {
                    TextField("이름을 입력하세요", text: $nameInput)
                        .keyboardType(.default)
                } header: {
                    Text("이름")
                }
                
                // 이메일
                Section {
                    TextField("이메일을 입력하세요", text: $emailInput)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                } header: {
                    Text("이메일")
                }
                
                // 비밀번호
                Section {
                    SecureField("비밀번호", text: $passwordInput)
                        .keyboardType(.default)
                    SecureField("비밀번호 확인", text: $passwordInput)
                        .keyboardType(.default)
                } header: {
                    Text("비밀번호")
                }
                
                Button {
                    print("회원가입 버튼 클릭")
                } label: {
                    Text("회원가입 하기")
                }

            }
        }.navigationTitle("회원가입 하기")
    }
}

#Preview {
    RegisterView()
}

