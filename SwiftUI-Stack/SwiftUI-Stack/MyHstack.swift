//
//  MyHstack.swift
//  SwiftUI-Stack
//
//  Created by 이경후 on 2021/08/18.
//

import SwiftUI

struct MyHstack : View {
    var body: some View{
        HStack(alignment: .center, spacing: 0){
            
//            Divider()
            
            Image(systemName: "flame.fill")
                .foregroundColor(.white)
                .font(.system(size: 90))
            
            Rectangle()
                .frame(width:100,height: 100)
                .foregroundColor(.blue)
            
            Rectangle()
                .frame(width:100,height: 100)
                .foregroundColor(.yellow)
                
        }
        .padding()
        .background(Color.green)
    }
}

struct MyHstack_Previews: PreviewProvider {
    static var previews: some View {
        MyHstack()
    }
}
