//
//  ProfileView.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/4/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State var id: String = ""
    @State var name: String = ""
    @State var email: String = ""
    @State var avatarImage: String = ""
    
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        if avatarImage.isEmpty {
                            Image(systemName: "person.fill.questionmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .frame(width: 250, height: 200, alignment: .center)
                        } else {
                            AsyncImage(url: URL(string: "\(avatarImage)")!) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 250, height: 200, alignment: .center)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 250, height: 200, alignment: .center)
                                case .failure(let error):
                                    Image(systemName: "person.fill.questionmark")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .padding()
                                        .frame(width: 250, height: 200, alignment: .center)
                                @unknown default:
                                    EmptyView()
                                        .frame(width: 250, height: 200, alignment: .center)
                                }
                            }
                        }
                        Spacer()
                    }
                }
                
                Section {
                    Text("아이디: \(id)")
                    Text("이름: \(name)")
                    Text("이메일: \(email)")
                }
                
                Button {
                    print("새로고침 버튼 클릭")
                } label: {
                    Text("새로고침")
                }
            }
        }
        .navigationTitle("내 프로필")
    }
}
