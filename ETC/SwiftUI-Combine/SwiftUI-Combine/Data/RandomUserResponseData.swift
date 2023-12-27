//
//  RandomUserResponseData.swift
//  SwiftUI-combine
//
//  Created by 이경후 on 12/27/23.
//

import Foundation

// MARK: - Results
struct RandomUserResponseData: Codable, CustomStringConvertible {
    let results: [RandomUser]
    let info: Info
    
    var description: String {
        return "results.count: \(results.count) / info : \(info.seed)"
    }
}

// MARK: - Info
struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - Result
struct RandomUser: Codable, Identifiable {
    var id = UUID()
    var name : Name
    var picture: Picture
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case picture = "picture"
    }
}

// MARK: - Name
struct Name: Codable, CustomStringConvertible {
    let title, first, last: String
    
    var description: String {
        return "[\(title)] \(first) \(last)"
    }
}

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}

