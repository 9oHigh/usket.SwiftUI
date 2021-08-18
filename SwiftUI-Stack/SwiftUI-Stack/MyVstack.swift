//
//  MyVstack.swift
//  SwiftUI-Stack
//
//  Created by 이경후 on 2021/08/18.
//

import SwiftUI

struct MyVstack : View {
    var body: some View {
        
        VStack(alignment:.center,spacing:20){
            Spacer()//가중치를 주는 것
            // 스택내의 각각의 객체들을 한 번에
            // 정렬할때 사용해보자.
            Divider().opacity(0)
            
            Text("STACK")
                .font(.system(size:30))
                .fontWeight(.bold)
                .padding(.top,20)
            //임의로 스페이서의 값을 바꿀 수 있음.
            Spacer().frame(width: 40)
            
            Rectangle() // 기본설정이 Frame
                .frame(width: 130,height: 130) // 기본설정이 다채움
                .foregroundColor(.red)
            //                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .frame(width: 130,height: 130)
                .foregroundColor(.green)
            //                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .frame(width: 130,height: 130)
                .foregroundColor(.blue)
            //                .edgesIgnoringSafeArea(.all)
            
            //위에 하나 밑에 두개라면 퍼센티지만큼 자리를 잡게 된다.
            Spacer()//가중치를 주는 것
            Spacer()
        }//VStack
        .frame(width:300)
        .background(Color.purple)
    }
}
