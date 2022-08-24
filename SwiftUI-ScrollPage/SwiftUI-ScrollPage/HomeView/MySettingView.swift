//
//  MySettingView.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/23.
//

import SwiftUI

struct MySettingView : View {
    @State var alertSignBell : Bool = false
    
    var body: some View{
        //리스트는 그 자체로 스크롤뷰를 갖는다!
        VStack(alignment: .center, spacing: 5){
            Text("설정 화면")
                .fontWeight(.bold)
                .font(.title)
                .padding()
            List{
                Section(
                    header: Text("화면"),
                    footer: Text("밝기는 최적화 하는 것이 좋습니다.")
                ){
                    Button(action:{
                        self.alertSignBell = true
                    }){
                        HStack{
                        Image(systemName: "lightbulb.fill")            .font(.system(size:20))
                            .foregroundColor(Color.black)
                        Text("밝기")
                            .font(.system(size:20))
                                .foregroundColor(Color.black)
                            .bold()
                        }
                        
                    }.alert(isPresented: $alertSignBell, content: {
                        Alert(title: Text("밝기 버튼"))
                    })
                }
                Section(
                    header: Text("알림"),
                    footer: Text("알림은 켜두는 것이 좋습니다.")
                ){
                    Button(action:{
                        self.alertSignBell = true
                    }){
                        HStack{
                        Image(systemName: "bubble.left.fill")            .font(.system(size:20))
                            .foregroundColor(Color.black)
                        Text("알림")
                            .font(.system(size:20))
                                .foregroundColor(Color.black)
                            .bold()
                        }
                        
                    }.alert(isPresented: $alertSignBell, content: {
                        Alert(title: Text("알림 버튼"))
                    })
                }
                Section(
                    header: Text("기타 설정"),
                    footer: Text("자세한 사항은 클릭 이후 가능합니다.")
                ){
                    Button(action:{
                        self.alertSignBell = true
                    }){
                        HStack{
                        Image(systemName: "gearshape")   .font(.system(size:20))
                            .foregroundColor(Color.black)
                        Text("기타 설정")
                            .font(.system(size:20))
                                .foregroundColor(Color.black)
                            .bold()
                        }
                        
                    }.alert(isPresented: $alertSignBell, content: {
                        Alert(title: Text("기타 설정 버튼"))
                    })
                }
                
                
            }
            .listStyle(GroupedListStyle())
        }
    }
}

struct MySettingView_Previews: PreviewProvider {
    static var previews: some View {
        MySettingView()
    }
}
