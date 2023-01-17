//
//  MyCustomTabView.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/24.
//

import SwiftUI

enum TabIndex {
    case home, cart, profile
}

struct MyCustomTabView: View {
    
    @State var tabIndex : TabIndex
    @State var lagerScale : CGFloat = 1.2
    
    func changeMyView(tabIndex : TabIndex) -> MyBackgroundColor{
        switch tabIndex {
        case .home:
            return MyBackgroundColor(title: "홈", color: Color.green)
        case .cart:
            return MyBackgroundColor(title: "장바구니", color: Color.orange)
        case .profile:
            return MyBackgroundColor(title: "프로필", color: Color.blue)
        }
    }
    func calculateXposition(display : GeometryProxy)->CGFloat{
        switch tabIndex {
        case .home:
            return -(display.size.width/3)
        case .cart:
            return 0
        case .profile:
            return display.size.width/3
        }
    }
    
    var body: some View{
        GeometryReader{ display in
            ZStack(alignment: .bottom){
                
                self.changeMyView(tabIndex: self.tabIndex)
                
                Circle()
                    .frame(width: 80, height: 90)
                    .offset(x: self.calculateXposition(display: display) ,y: 10)
                    .foregroundColor(.white)
                
                HStack(spacing: 0){
                    
                    Button(action:{
                        print("홈 버튼")
                        withAnimation{
                            self.tabIndex = .home
                        }
                    }){
                        Image(systemName: "house.fill")
                            .font(.system(size:25))
                            .foregroundColor(self.tabIndex == .home ? Color.green : Color.gray)
                            .scaleEffect(self.tabIndex == .home ? self.lagerScale : 1)
                            .offset(y: self.tabIndex == .home ? -10: 0 )
                            .frame(width: display.size.width/3,height:50)
                        
                    }.background(Color.white)
                    
                    Button(action:{
                        print("장바구니 버튼")
                        withAnimation{
                            self.tabIndex = .cart
                        }
                    }){
                        Image(systemName: "cart.fill")
                            .font(.system(size:25))
                            .foregroundColor(self.tabIndex == .cart ? Color.orange : Color.gray)
                            .scaleEffect(self.tabIndex == .cart ? self.lagerScale : 1)
                            .offset(y: self.tabIndex == .cart ? -10: 0 )
                            .frame(width: display.size.width/3,height:50)
                        
                    }.background(Color.white)
                    
                    Button(action:{
                        print("프로필 버튼")
                        withAnimation{
                            self.tabIndex = .profile
                        }
                    }){
                        Image(systemName: "person.fill")
                            .font(.system(size:25))
                            .foregroundColor(self.tabIndex == .profile ? Color.blue : Color.gray)
                            .scaleEffect(self.tabIndex == .profile ? self.lagerScale : 1)
                            .offset(y: self.tabIndex == .profile ? -10: 0 )
                            .frame(width: display.size.width/3,height:50)
                        
                    }.background(Color.white)
                }
            }
            .frame(width: display.size.width, height: display.size.height, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct MyCustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyCustomTabView(tabIndex: .home)
    }
}
