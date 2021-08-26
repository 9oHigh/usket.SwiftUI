//
//  MyLinkView.swift
//  SwfitWebView
//
//  Created by 이경후 on 2021/08/17.
//

import SwiftUI

struct MyLinkView: View {
    
    var linkNmae : String
    var colorType : Color
    var fontColor : Color
    
    init(_linkName : String,_colorType : Color,_fontColor: Color) {
        linkNmae = _linkName
        colorType = _colorType
        fontColor = _fontColor
    }
    
    var body: some View{
        VStack{
            Text(linkNmae)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 15))
                .padding(15)
                .background(colorType)
                .foregroundColor(.white)
                .cornerRadius(10)
        }.padding(.all,10)
    }
}
