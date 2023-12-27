//
//  ProfileImageView.swift
//  SwiftUI-combine
//
//  Created by 이경후 on 12/27/23.
//

import Foundation
import SwiftUI
import URLImage

struct ProfileImageView: View {
    
    var imageUrl: URL
    
    var body: some View {
        URLImage(imageUrl) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 50, height: 60)
        .clipShape(.circle)
        .overlay(Circle().stroke(Color.init(.yellow), lineWidth: 2))
    }
}
