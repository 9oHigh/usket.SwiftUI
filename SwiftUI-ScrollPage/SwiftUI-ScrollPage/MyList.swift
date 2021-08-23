//
//  MyList.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/23.
//

import SwiftUI

struct MyList: View{
    
    @Binding var isNavigationBarHidden : Bool
    init(isNavigationBarHidden : Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    
    var body: some View{
        //List - 리스트 형식으로 VStack과는 다른 뷰임을 알아두자.
        List{
            //Section - 말 그대로 일정한 크기 안의 구역에서 헤더와 푸터를 가지고 각각의 구조체들의 값을 가지고 있을 수 있다.
            Section(
                header: Text("오늘 할 일").font(.headline).foregroundColor(.black),
                footer: Text("2021년 8월 20일").font(.headline)
            ){
                ForEach(1...5,id:\.self){ itemIndex in
                    MySubCardView(_cardColor: Color.purple,_cardName: "Burnning Study",_cardImage: "flame.fill",_startPoint: "8AM",_endPoint: "9AM")
                }
            }
            //리스트 외형
            .listRowInsets(EdgeInsets.init(top: 5 , leading: 10, bottom: 5, trailing: 10))
            
            Section(
                header: Text("내일 할 일").font(.headline).foregroundColor(.black),
                footer: Text("2021년 8월 21일").font(.headline)
            ){
                ForEach(1...5,id:\.self){ itemIndex in
                    MySubCardView(_cardColor: Color.blue,_cardName: "Burnning Study",_cardImage: "flame.fill",_startPoint: "8AM",_endPoint: "9AM")
                }
            }
            .listRowInsets(EdgeInsets.init(top: 5 , leading: 10, bottom: 5, trailing: 10))
            
        }
        //리스트의 스타일 종류 알아두기
        .listStyle(GroupedListStyle())
        .navigationTitle("Things")
//        .navigationBarHidden(self.isNavigationBarHidden)
//        .onAppear{
//            self.isNavigationBarHidden = false
//        }
    }// NavigationView
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
