//
//  UserData.swift
//  SwiftUI-SignUp,SignIn
//
//  Created by 이경후 on 1/4/24.
//

import Foundation

struct UserData: Codable, Identifiable {
    var uuid: UUID = UUID()
    var id: Int
    var name: String
    var email: String
    var avatar: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case email = "email"
        case avatar = "avatar"
    }
}
