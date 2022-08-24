//
//  MyImageView.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/23.
//

import SwiftUI

struct MyImageView : View {
    var body: some View{
        
        Circle().foregroundColor(.yellow)
            .overlay(
                Image("MyCharacter")
                    .frame(width: 300, height: 300, alignment: .center)
                    .background(Color.black)
                    .clipShape(Circle())
            )
            .frame(width: 350, height: 350, alignment: .center)
            .shadow(radius: 10)
            .padding()
    }
}

struct MyImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageView()
    }
}
