//
//  ContentView.swift
//  SwiftUI-Menu
//
//  Created by 이경후 on 2021/09/16.
//

import SwiftUI

let myPets = ["멍멍이 🐶","야옹이 😸","찍찍이 🐭"]

struct ContentView: View {
    
    @State private var shouldShowAlert : Bool = false
    @State private var message : String = ""
    @State private var selected : Int = 0
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20){
                Spacer()
                Text("\(myPets[selected])")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                Text("우측 상단의 메뉴를 눌러주세요!")
                Spacer()
                Spacer()
            }
            .navigationTitle("하이요")
            //툴바
            .toolbar(content: {
                // 툴바아이템 -> 위치,내용
                // 기존 프로젝트(ShareMemo)에서는 + 모양의 임이의 버튼을 만들어사용
                ToolbarItem(placement: .primaryAction , content: {
                    Menu(content: {
                        Picker(selection: $selected, label: Text("애완동물 선택"), content: {
                            ForEach(myPets.indices, id: \.self,content:{
                                index in
                                Text("\(myPets[index])").tag(index)
                            })
                            
                        })
                        Section{
                            Button(action: {
                                shouldShowAlert = true
                                message = "화이팅하세요>_<"
                            }, label: {
                                Label("오늘도 빡코딩",systemImage: "flame.fill")
                            })
                            Button(action: {
                                shouldShowAlert = true
                                message = "푹쉬세요>_<"
                            }, label: {
                                Label("집에서 쉬는 날",systemImage: "hand.thumbsup")
                            })
                        }
                        
                        Section{
                            //멀티 트레일링 클로저 - 굉장히 간결한 작성이 가능할 것 같아서 알아두면 좋을 것 같다.
                            Button {
                                
                            } label: {
                                Label("새 파일 만들기",systemImage: "doc")
                            }
                            Button {
                                
                            } label: {
                                Label("새 폴더 만들기",systemImage: "folder")
                            }
                        }
                        
                        Section{
                            //멀티 트레일링 클로저
                            Button {
                                
                            } label: {
                                Label("파일 모두 삭제",systemImage: "trash")
                            }
                        }
                        
                    },label: {
                        Circle()
                            .foregroundColor(Color.init(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)))
                            .frame(width: 50, height: 50)
                            .overlay(
                                Label("더보기",systemImage:"ellipsis")
                                    .font(.system(size: 30))
                                    .foregroundColor(.white)
                            )
                    })
                    //메뉴
                })
            })
            .alert(isPresented: $shouldShowAlert, content: {
                Alert(title: Text("알림"), message:Text("\(message)"), dismissButton: .default(Text("확인")))
            })
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
