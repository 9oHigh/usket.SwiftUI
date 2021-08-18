//
//  MyZstack.swift
//  SwiftUI-Stack
//
//  Created by 이경후 on 2021/08/18.
//

import SwiftUI

struct MyZstack : View{
    var body: some View{
        ZStack(alignment: .center){
            
            Rectangle()
                .frame(width:150,height: 150)
                .foregroundColor(.green)
                // 깊이에 따른 인덱스값
                // 바닥이 0 ~ 가장 앞쪽이 maxIndex
                // .zIndex(0)
            Rectangle()
                .frame(width:130,height: 130)
                .foregroundColor(.blue)
            Rectangle()
                .frame(width:110,height: 110)
                .foregroundColor(.red)
            Rectangle()
                .frame(width:100,height: 100)
                .foregroundColor(.yellow)
            
        }
    }
}

struct MyZstack_Previews: PreviewProvider {
    static var previews: some View {
       MyZstack()
    }
}
