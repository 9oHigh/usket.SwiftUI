//
//  ContentView.swift
//  SwiftUIBasic
//
//  Created by 이경후 on 2021/08/16.
//

import SwiftUI

struct ContentView: View {

    @State
    private var isActivated: Bool = false
    
    var body: some View {
        //뷰를 순서대로 쌓아올리는 느낌
        NavigationView{
            // HStack과 VStack이 존재한다.
            VStack{
                HStack{
                    //MyStackView.swfit 파일로 부터 구조체를 가져옴.
                    //하나의 파일에 구조체를 저장하고 사용하면 콘텐트뷰가 깔끔하게 정되 될 것 같다.
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)
                }
                //.(속성)을 이용하여 각각의 색, 패딩, 사이즈등을 조절할 수 있다.
                // isActivated는 toggle()에 의해서 온/오프된다.
                .padding(isActivated ? 30.0:10.0)
                .background(isActivated ? Color.red : Color.black)
                
                //view를 클릭했을 경우 온탭제스쳐를 활용하자.
                .onTapGesture {
                    //Animation 효과를 주는 메소드
                    withAnimation(){
                        //toggle()은 ture -> false / false -> true
                        //즉, 값이 변경되면 ContentView를 다시 그림
                        self.isActivated.toggle()
                    }
                }
                // 네비게이션 버튼(링크) - 네비게이션뷰에서 사용할 수 있는 버튼 형식의 링크
                //destination은 클릭했을 때 보여줄 View를 사용
                NavigationLink(destination: MyTextView(isActivated: $isActivated)){
                    Text("네비게이션")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }.padding(.top,50)
            }
        }//NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
