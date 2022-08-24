//
//  MyNavigationView.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/23.
//

import SwiftUI

struct MyNavigationView : View {
    // Xcode 12 부터는 필요없어진 기능
    //    @Binding var isNavigationBarHidden : Bool
    //    init(isNavigationBarHidden : Binding<Bool> = .constant(false)) {
    //        _isNavigationBarHidden = isNavigationBarHidden
    //    }
    
    var body: some View{
        
        ScrollView{
            VStack{
                MyImageView()
                Text("개발하는 9oHigh")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Swift & iOS")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack{
                    Rectangle().frame(width: 130, height: 50)
                        .foregroundColor(.red)
                        .cornerRadius(20)
                        .overlay(
                            Text("구독하러 가기")
                                .font(.system(size: 20))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                        )
                    
                    Rectangle().frame(width: 130, height: 50)
                        .foregroundColor(.orange)
                        .cornerRadius(20)
                        .overlay(
                            Text("오픈 카톡방")
                                .font(.system(size: 20))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                        )
                }//HStack
            }//VStack
        }//ScrollView
        
        /*
         https://developer.apple.com/forums/thread/124757?page=3에 의하면
         navigationBarItems + navigationLink를 이용하면
         이전 뷰로 돌아오는 기능에 충돌이 발생하고 root View로 돌아오게 된다.
         따라서, 수정 이전까지는 nav Bar를 따로 만들어 Link를 줘야한다.
         default -> largeTitle
         ,inline -> 상단에 고정
         ,Large -> 글자에 애니메이션효과 + 스크롤 내릴시 상단 고정(인라인)
         ,automatic -> large랑 비슷, 거의 같음
         */
        .navigationBarItems(
            trailing:
                NavigationLink(destination:
                                MySettingView()
                )
                {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
        )
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
