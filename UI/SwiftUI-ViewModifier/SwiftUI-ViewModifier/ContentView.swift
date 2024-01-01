//
//  ContentView.swift
//  SwiftUI-ViewModifier
//
//  Created by 이경후 on 1/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello, world!")
                .modifier(MyroundedText())
            
            Text("Hello, world!")
                .modifier(MyroundedText())
            
            Text("헬로 월드")
                .myRoundedTextStyle()
            
            Image(systemName: "pencil")
                .myRoundedTextStyle()
            
            Rectangle()
                .frame(width: 100, height: 100)
                .myRoundedTextStyle()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
