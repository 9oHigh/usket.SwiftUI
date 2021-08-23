//
//  MyCardView.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/18.
//

import SwiftUI

struct MyCardView : View {
    
    @State var alertSign : Bool = false
    
    var body: some View{
        
        VStack(alignment: .leading,spacing: 0){
            // 이걸 넣음으로써 가로폭을 모두 채울 수 있음
            // Rectangle().frame(height: 0)
            // 혹은 spacing : 0
            
            Text("경후의 Youtube Project")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom,5)
            
            Text("10 AM ~ 11 AM")
                .foregroundColor(.secondary)
                .padding(.bottom,5)
            
            HStack{
                Image("MyFriend")
                    .resizable()
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 4)
                            .foregroundColor(.orange)
                    )
                Image("MyPerson")
                    .resizable()
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                Image("MyGirl")
                    .resizable()
                    .frame(width: 50,height: 50)
                    .clipShape(Circle())
                Spacer()
                // 버튼 - 액션 부분
                Button(action: {
                    self.alertSign = true
                }){
                // 버튼 - 외형 부분
                Text("완료")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 80)
                    .background(Color.blue)
                    .cornerRadius(20)
                    // alert()메소드를 이용하여 인자전달 및 메세지 표시
                }.alert(isPresented: $alertSign){
                    Alert(title: Text("확인되었습니다."))
                }
            }
        }//Vsatack
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct MyCardView_Previews: PreviewProvider {
    static var previews: some View {
        MyCardView()
    }
}
