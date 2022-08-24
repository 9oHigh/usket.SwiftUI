//
//  MyBackgroundColor.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/24.
//

import SwiftUI

struct MyBackgroundColor : View {
    var title : String
    var color : Color
    
    var body: some View{
        
        ZStack{
            color
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(.white)
            
        }.animation(.easeInOut)
    }
}
