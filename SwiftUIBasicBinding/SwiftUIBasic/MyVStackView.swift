//
//  MyVStackView.swift
//  SwiftUIBasic
//
//  Created by 이경후 on 2021/08/17.
//

import SwiftUI

struct MyVStackView : View{
    // Binding - 데이터 연동
    @Binding
    var isActivated : Bool
    
    // 생성자
    init(isActivated : Binding<Bool> = .constant(false)){
        _isActivated = isActivated
    }
    
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
        }//VStack
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
}

struct MyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVStackView()
    }
}
