//
//  ContentView.swift
//  SwiftUI-Darkmode
//
//  Created by 이경후 on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State fileprivate var shouldShowAlert = false
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack {
            Theme.myBackgroundColor(forScheme: scheme)
            VStack {
                
                Spacer()
                
                Button {
                    shouldShowAlert.toggle()
                } label: {
                    Text("로그인 하러 하기")
                }
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .padding()
                .background(Theme.myButtonBackgroundColor(forScheme: scheme))
                .clipShape(.rect(cornerRadius: 13))
                .overlay(
                    RoundedRectangle(cornerRadius: 13)
                        .stroke(Color.white)
                )
                .alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("안녕"), message: Text("만나서 반가워!") , dismissButton: .default(Text("닫기")))
                })
                
                Spacer()
                    .frame(height: 100)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        if scheme == .dark {
            return Color.black
        } else {
            return Color.white
        }
    }
    
    static func myButtonBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        if scheme == .dark {
            return Color.purple
        } else {
            return Color.pink
        }
    }
}
