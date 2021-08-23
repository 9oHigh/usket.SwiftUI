//
//  MySectionView.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/23.
//

import SwiftUI

struct MySectionView : View {
    
    @State var alertSignBell : Bool
   
    
    var body: some View{
        List{
        Section(
            header: Text("알림"),
            footer: Text("알림은 켜두는 것이 좋습니다.")
        ){
            Button(action:{
                self.alertSignBell = true
            }){
                HStack{
                Image(systemName: "bubble.left.fill")
                    .font(.system(size:20))
                    .foregroundColor(Color.black)
                Text("알림")
                    .font(.system(size:20))
                        .foregroundColor(Color.black)
                    .bold()
                }
                
            }.alert(isPresented: $alertSignBell, content: {
                Alert(title: Text("밝기 버튼"))
            })
        }
        }
    }
}

struct MySectionView_Previews: PreviewProvider {
    static var previews: some View {
        MySectionView(alertSignBell: true)
    }
}
