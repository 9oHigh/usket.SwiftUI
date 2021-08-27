//
//  ContentView.swift
//  Securefield
//
//  Created by 이경후 on 2021/08/27.
//

import SwiftUI

struct ContentView: View {
    
    @State private var id: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            
            Image("myBeachImage")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            Image("MyCharacter")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y:-250)

            VStack(alignment: .center, spacing: 10){
                
                Text("LOGIN")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom,10)
                
                HStack(spacing: -15){
                    
                    TextField("사용자 이름",text:$id)
                        //.border(Color.gray, width: 0.5)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    //조건문을 통해서 버튼을 넣는 케이스
                    Button(action:{
                        self.id = ""
                    }){
                        Image(systemName: self.id != "" ? "clear.fill" : "")
                            .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.secondary)
                            .cornerRadius(30)
                            .offset(x: -10)
                    }
                }
                HStack(spacing: -15){
                    SecureField("비밀번호",text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                        .border(Color.gray, width: 0.5)
                    
                    //조건문을 넣지 않을 경우 ""에 해당하는 이미지를 찾지 못해 오류가 발생할 수 있다.
                    Button(action:{
                        self.password = ""
                    }){
                        Image(systemName: password != "" ? "clear.fill" : "")
                            .frame(width: 15, height: 15, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.gray)
                            .cornerRadius(30)
                            .offset(x: -5)
                    }
                }
                .padding(.bottom,10)
                HStack{
                    Text("회원가입")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .padding(5)
                        .background(Color.white)
                        .cornerRadius(5)
                        
                    
                    Text("아이디/비밀번호찾기")
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .padding(5)
                        .background(Color.white)
                        .cornerRadius(5)
                }
            }
            .padding(.horizontal,50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
