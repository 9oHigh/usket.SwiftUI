//
//  MyButtonStyle.swift
//  SwiftUI-ButtonStyle
//
//  Created by 이경후 on 2021/08/26.
//

import SwiftUI

enum MyButtonType {
    case tab,long,zoomOut,rotate,blur
}

struct MyButtonStyle : ButtonStyle {
    
    var buttonColor : Color
    var buttonType : MyButtonType
    
    
    func makeBody(configuration: Configuration) -> some View {
    
        configuration.label
            .padding()
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(buttonColor)
            .cornerRadius(20)
            
            //확대
            .scaleEffect(configuration.isPressed && (self.buttonType == .tab || self.buttonType == .long)  ? 1.3 : 1.0)
            
            //축소
            .scaleEffect(configuration.isPressed && self.buttonType == .zoomOut ? 0.7 : 1.0)
            .opacity(configuration.isPressed && self.buttonType == .zoomOut ? 0.5 : 1.0)
            
            // 짧은 햅틱 반응
            .onTapGesture {
                if (self.buttonType == .tab){
                    let haptic = UIImpactFeedbackGenerator(style: .light)
                    haptic.impactOccurred()
                }
            }
            // 긴 햅틱 반응
            .onLongPressGesture {
                if (self.buttonType == .long){
                    let haptic = UIImpactFeedbackGenerator(style: .heavy)
                    haptic.impactOccurred()
                }
            }
            //회전
            .rotationEffect( configuration.isPressed && self.buttonType == .rotate ? .degrees(360.0) : .degrees(0)
                             //회전의 기준점을 정할 수 있음
                             //,anchor: .bottomTrailing
            )
            //블러
            .blur(radius: configuration.isPressed && self.buttonType == .blur ? 5 : 0)
    }
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action:{
          print("Button")
        },label:{
            Text("My Button")
        })
        .buttonStyle(MyButtonStyle(buttonColor: Color.blue, buttonType: .rotate))
    }
}
