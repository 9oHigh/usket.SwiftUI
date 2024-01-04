//
//  UserListView.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/4/24.
//

import SwiftUI

struct UserListView: View {
    
    @State var users: [UserData] = [UserData(id: 0, name: "호호호", email: "adsf@asdf", avatar: "https://www.gravatar.com/avatar/54498b4571f8d9eb48736a69019391f9.jpg?s=200&d=robohash"), UserData(id: 1, name: "키키키", email: "adsf@asdf", avatar: "https://www.gravatar.com/avatar/54498b4571f8d9eb48736a69019391f9.jpg?s=200&d=robohash"), UserData(id: 2, name: "빠빠빠", email: "adsf@asdf", avatar: "https://www.gravatar.com/avatar/54498b4571f8d9eb48736a69019391f9.jpg?s=200&d=robohash")]
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
    }
}

#Preview {
    UserListView()
}
