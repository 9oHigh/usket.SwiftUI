//
//  ContentView.swift
//  SwiftUI-ToastAndPopup
//
//  Created by 이경후 on 2021/09/08.
//

import SwiftUI
import ExytePopupView

struct ContentView: View {
    
    @State var showingPopup : Bool = false
    @State var showingBottomToast : Bool = false
    @State var showingTopToast : Bool = false
    @State var showingBottomSolid : Bool = false
    @State var showingTopSolid : Bool = false
    
    func createBottomToast() -> some View {
        HStack(alignment: .top, spacing : 20){
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 60, height: 60)
                .offset(y:10)
                .cornerRadius(10)
            
            
            VStack(alignment: .leading,spacing: 10){
                Text("정대리 수업 공지")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("플로팅 메세지! 플로팅 메세지! 플로팅 메세지! 플로팅 메세지! 플로팅 메세지! 플로팅 메세지! 플로팅 메세지! 플로팅 메세지! 플로팅 메세지! 플로팅 메세지!")
                    .foregroundColor(.white)
            }
        }
        .padding(15)
        .frame(width: 300)
        .background(Color.green)
        .cornerRadius(20)
    }
    
    func createTopToast() -> some View {
        HStack(alignment : .center, spacing : 10){
            Image(systemName: "paperplane.fill")
                .font(.system(size: 25))
                .foregroundColor(.white)
            
            VStack(alignment: .leading){
                Text("정대리님의 메세지")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("오늘도 빡코딩하고 계신가요?")
                    .foregroundColor(.white)
            }
        }
        .frame(width: 270,height: 60)
        .background(Color.orange)
        .cornerRadius(50)
    }
    
    func createBottomSolid() -> some View {
        HStack(spacing : 10){
            Image(systemName: "book.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
            VStack(alignment: .leading){
                Text("안내메세지")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                Text("밑에서 올라오는 메세지입니다!")
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 10)
        .background(Color.purple)
    }
    func createTopSolid() -> some View {
        HStack(alignment: .top, spacing : 15){
            Image("pig")
                .resizable()
                .aspectRatio(contentMode: ContentMode.fill)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            VStack(alignment: .leading){
                Text("안내메세지")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                Text("위에서 내려오는 메세지입니다! 위에서 내려오는 메세지입니다!")
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal,10)
        .padding(.bottom,20)
        .frame(width: UIScreen.main.bounds.width)
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 20 : 50)
        .background(Color.blue)
    }
    
    func createPopup() -> some View {
        VStack(spacing: 10){
            Image("pig")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 70, height: 70, alignment:.center)
            
            Text("개발하는 9oHigh")
                .fontWeight(.bold)
                .font(.system(size: 25))
                .foregroundColor(.white)
            
            Text("안녕하세요. 감사해요.\n잘있어요. 다시만나요.\n 아침해가 뜨면 (아침해가 뜨면~)\n매일같은 사람들만 또 다시 새로운 하루일을 시작해\n뚜루루루 뚜루루루 뚜루루루 뚜뚜뚜\n안녕하세요. 감사해요.\n잘있어요. 다시만나요.\n 아침해가 뜨면 (아침해가 뜨면~)\n매일같은 사람들만 또 다시 새로운 하루일을 시작해\n뚜루루루 뚜루루루 뚜루루루 뚜뚜뚜")
                .lineLimit(.none)
                .font(.system(size: 15))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.bottom,20)
            Button(action:{
                self.showingPopup = false
            }){
                Text("닫기")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hexcode: "FF5F00"))
                    .background(Color.white)
            }
            .frame(width: 100, height: 40)
            .background(Color.white)
            .cornerRadius(10)
        }
        .frame(width: 350, height: 450, alignment: .center)
        .background(Color(hexcode: "FF5F00"))
        .cornerRadius(10)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 20){
                
                //BottomSolidMessage
                Button(action: {
                    self.showingBottomSolid = true
                }, label: {
                    Text("BottomSolidMessage")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                })
                
                //BottomToastMessage
                Button(action: {
                    self.showingBottomToast = true
                }, label: {
                    Text("BottomToastMessage")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                })
                
                //TopSolidMessage
                Button(action: {
                    self.showingTopSolid = true
                }, label: {
                    Text("TopSolidMessage")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                
                //TopToastMessage
                Button(action: {
                    self.showingTopToast = true
                }, label: {
                    Text("TopToastMessage")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                })
                
                //Popup
                Button(action: {
                    self.showingPopup = true
                }, label: {
                    Text("Popup")
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color(hexcode: "FF5F00"))
                        .cornerRadius(10)
                })
                //                Spacer()
            }//Vstack
        }//Zstack
        .edgesIgnoringSafeArea(.all)
        .popup(isPresented: $showingBottomSolid, type: .toast, position: .bottom, animation: .easeInOut, autohideIn: 2, dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true, view: {
            self.createBottomSolid()
        })
        .popup(isPresented: $showingBottomToast, type: .floater(verticalPadding: 20), position: .bottom, animation: .easeInOut, autohideIn: 2, dragToDismiss: true, closeOnTap: false, closeOnTapOutside: true, view: {
            self.createBottomToast()
        })
        .popup(isPresented: $showingTopSolid, type: .toast, position: .top, animation: .easeInOut, autohideIn: 2, dragToDismiss: false, closeOnTap: true, closeOnTapOutside: true, view: {
            self.createTopSolid()
        })
        .popup(isPresented: $showingTopToast, type: .floater(verticalPadding: UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 20 : 40), position: .top, animation: .easeInOut, autohideIn: 2, dragToDismiss: true, closeOnTap: true, closeOnTapOutside: true, view: {
            self.createTopToast()
        })
        .popup(isPresented: $showingPopup, type: .default, position: .bottom, animation: .spring(), autohideIn: 2, dragToDismiss: false, closeOnTap: false, closeOnTapOutside: false,view: {
            self.createPopup()
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
