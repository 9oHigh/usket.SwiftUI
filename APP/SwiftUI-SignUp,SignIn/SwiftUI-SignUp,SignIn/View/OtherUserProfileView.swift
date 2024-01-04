//
//  OtherUserProfileView.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/4/24.
//

import SwiftUI

struct OtherUserProfileView: View {
    
    var userData: UserData
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        AsyncImage(url: URL(string: "\(userData.avatar)")!) { phase in
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
                        Spacer()
                    }
                }
                Section {
                    Text("아이디: \(userData.id)")
                } header: {
                    Text("아이디")
                        .font(.callout)
                }
                
                Section {
                    Text("이름: \(userData.name)")
                } header: {
                    Text("이름")
                        .font(.callout)
                }
                
                Section {
                    Text("이메일: \(userData.email)")
                } header: {
                    Text("이메일")
                        .font(.callout)
                }
            }
        }
        .navigationTitle("\(userData.name)")
    }
}
