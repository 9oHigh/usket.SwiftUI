//
//  MyTabView.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/24.
//

import SwiftUI

struct MyTabView : View {
    
    
    var body: some View{
        
        TabView{
            //보여지는 부분
            MyBackgroundColor(title: "홈", color: Color.blue)
                .tabItem {
                    Image(systemName: "house.fill")
                }
                .tag(2)
            
            MyBackgroundColor(title: "장바구니", color: Color.orange)
                .tabItem {
                    Image(systemName: "cart.fill")
                }
                .tag(2)
                .background(Color.yellow)
            
            MyBackgroundColor(title: "프로필", color: Color.green)
                .tabItem {
                    Image(systemName: "person.fill")
                }
                .tag(2)
                .background(Color.green)
            
        }//TabView
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
