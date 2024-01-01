//
//  ViewModifier.swift
//  SwiftUI-ViewModifier
//
//  Created by 이경후 on 1/1/24.
//

import Foundation
import SwiftUI

struct MyroundedText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .background(Color.yellow)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(lineWidth: 10.0)
                    .foregroundStyle(.red)
            )
    }
}

extension View {
    func myRoundedTextStyle() -> some View {
        modifier(MyroundedText())
    }
}
