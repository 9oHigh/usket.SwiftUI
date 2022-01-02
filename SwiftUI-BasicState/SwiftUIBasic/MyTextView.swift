//
//  MyTextView.swift
//  SwiftUIBasic
//
//  Created by 이경후 on 2021/08/17.
//

import SwiftUI

struct MyTextView: View{
    //@State 값이 변하는 것을 감지하고 변했다면 다시 View를 실행한다.
    @State
    private var index: Int = 0
    
    //배경색 배열
    private let backgroundColors = [
        Color.red,
        Color.blue,
        Color.green,
        Color.yellow,
        Color.pink
    ]
    
    var body: some View{
        VStack{
            Spacer() // 뷰사이의 간격 설정, 뷰의 크기 확장 용도로 사용되는 뷰이다.
            Text("배경 아이템 인덱스 \(self.index + 1)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                //frame을 이용하여 너비,높이를 조절한다.
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
            Spacer()
        }.background(backgroundColors[index])
        // 노치영역이나 바닥영역등을 .bottom / .top / .all을 이용하여 확장할 수 있다.
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경 아이템 클릭!")
            if self.index == self.backgroundColors.count-1 {
                self.index = 0
            }else{
                self.index += 1
            }
        }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
