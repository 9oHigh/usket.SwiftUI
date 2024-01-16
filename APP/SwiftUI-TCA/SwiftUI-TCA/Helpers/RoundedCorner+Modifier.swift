//
//  RoundedCorner+Modifier.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/17/24.
//

import SwiftUI

struct TopRoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func setRoundedCorner(radius: CGFloat) -> some View {
        clipShape(TopRoundedCorner(radius: radius, corners: [.topLeft, .topRight]))
    }
}
