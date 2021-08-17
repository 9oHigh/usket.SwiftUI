//
//  MyVStackView.swift
//  SwiftUIBasic
//
//  Created by 이경후 on 2021/08/17.
//

import SwiftUI

struct MyVStackView : View{
    var body: some View{
        VStack{
            Text("One")
                //폰트의 사이즈나 두께, 패딩등을 조절가능하다.
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .font(.system(size: 20))
                .padding()
            Text("Two")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .font(.system(size: 20))
                .padding()
        }
        .padding(10)
        .background(Color.yellow)
    }
}

struct MyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVStackView()
    }
}
