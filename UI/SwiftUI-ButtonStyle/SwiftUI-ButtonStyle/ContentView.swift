//
//  ContentView.swift
//  SwiftUI-ButtonStyle
//
//  Created by 이경후 on 2021/08/26.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 15){
            Button(
                action: {
                    print("Button")
                    
                }, label: {
                    Text("짧게 누르기")
                        .fontWeight(.bold)
                })
                .buttonStyle(MyButtonStyle(buttonColor: Color.blue, buttonType: .tab))
            Button(
                action: {
                    print("Button")
                    
                }, label: {
                    Text("길게 누르기")
                        .fontWeight(.bold)
                })
                .buttonStyle(MyButtonStyle(buttonColor: Color.orange, buttonType: .long))
            Button(
                action: {
                    print("Button")
                    
                }, label: {
                    Text("축소 시키기")
                        .fontWeight(.bold)
                })
                .buttonStyle(MyButtonStyle(buttonColor: Color.yellow, buttonType: .zoomOut))
            Button(
                action: {
                    print("Button")
                    
                }, label: {
                    Text("회전 시키기")
                        .fontWeight(.bold)
                })
                .buttonStyle(MyButtonStyle(buttonColor: Color.red, buttonType: .rotate))
            Button(
                action: {
                    print("Button")
                    
                }, label: {
                    Text("블러 처리하기")
                        .fontWeight(.bold)
                })
                .buttonStyle(MyButtonStyle(buttonColor: Color.green, buttonType: .blur))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
