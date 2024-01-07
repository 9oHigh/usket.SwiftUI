//
//  UserListView.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/4/24.
//

import SwiftUI

struct UserListView: View {
    
    @EnvironmentObject var userViewModel: UserViewModel
    @State var users: [UserData] = []
    @State var emailInput: String = ""
    @State var passwordInput: String = ""
    
    var body: some View {
        List(users) { aUser in
            NavigationLink {
                OtherUserProfileView(userData: aUser)
            } label: {
                HStack {
                    AsyncImage(url: URL(string: aUser.avatar)!) {
                        phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 120, height: 120, alignment: .center)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120, alignment: .center)
                        case .failure(let error):
                            Image(systemName: "person.fill.questionmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                                .frame(width: 120, height: 120, alignment: .center)
                        @unknown default:
                            EmptyView()
                                .frame(width: 120, height: 120, alignment: .center)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("\(aUser.name)")
                            .font(.title3)
                        Text("\(aUser.email)")
                            .font(.callout)
                    }
                    Spacer()
                }
            }
        }
        .navigationTitle("사용자 목록")
        .onAppear(perform: { userViewModel.fetchUserList() })
        .onReceive(userViewModel.$userList) { self.users = $0 }
    }
}

#Preview {
    UserListView()
}
