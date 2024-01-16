//
//  Memo.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/16/24.
//

import Foundation

struct Memo: Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var date: Date
}
