//
//  RandomUserRowView.swift
//  SwiftUI-combine
//
//  Created by 이경후 on 12/27/23.
//

import Foundation
import SwiftUI

struct RandomUserRowView: View {
    
    var randomUser: RandomUser
    
    init(randomUser: RandomUser) {
        self.randomUser = randomUser
    }
    
    var body: some View {
        HStack {
            ProfileImageView(imageUrl: URL(string: self.randomUser.picture.medium)!)
            Text("\(randomUser.name.description)")
                .fontWeight(.heavy)
                .font(.system(size: 25))
                .lineLimit(2)
                .minimumScaleFactor(0.5)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
        .padding(.vertical)
    }
}
