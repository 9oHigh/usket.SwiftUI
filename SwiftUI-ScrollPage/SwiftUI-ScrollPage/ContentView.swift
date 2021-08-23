//
//  ContentView.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/18.
//

import SwiftUI

struct ContentView: View {
    @State var isNavigationBarHidden : Bool = false
    
    var body: some View {
        //리스트를 가지고 있는 뷰를 보여주기 위해서 Navigation 뷰로 전체를 감싸야한다.
        NavigationView{
            ZStack(alignment: .bottomTrailing){
                
                VStack(alignment:.leading,spacing: 0){
                    
                    HStack{
                        // 목록 아이콘을 통해서 리스트뷰로 이동하므로
                        // 링크는 아이콘으로 설정
                        NavigationLink(destination: MyList(isNavigationBarHidden: self.$isNavigationBarHidden)){
                        Image(systemName: "line.horizontal.3")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        }
                        Spacer()
                        Image(systemName: "person.crop.circle.fill")
                            .font(.largeTitle)
                        
                    }
                    .padding(20)
                    
                    Text("경후의 To do list")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .padding(.horizontal,20)
                    
                    ScrollView{
                        VStack(spacing: 5){
                            MyCardView()
                            MySubCardView(_cardColor: Color.purple, _cardName: "Youtube Live Burnning", _cardImage: "flame.fill",_startPoint: "8AM",_endPoint: "9AM")
                            MySubCardView(_cardColor: Color.red, _cardName: "Watching", _cardImage: "tv.fill",_startPoint: "9AM",_endPoint: "10AM")
                            MySubCardView(_cardColor: Color.orange, _cardName: "Shopping", _cardImage: "cart.fill",_startPoint: "11AM",_endPoint: "13PM")
                            MySubCardView(_cardColor: Color.blue, _cardName: "Gamming", _cardImage: "gamecontroller.fill",_startPoint: "14PM",_endPoint: "16PM")
                            MySubCardView(_cardColor: Color.pink, _cardName: "Playing Guitar", _cardImage: "guitars.fill",_startPoint: "16PM",_endPoint: "17PM")
                            MySubCardView(_cardColor: Color.green, _cardName: "Taking Pictures", _cardImage: "camera.fill",_startPoint: "19PM",_endPoint: "20PM")
                            MySubCardView(_cardColor: Color.orange, _cardName: "Studying", _cardImage: "pencil.tip",_startPoint: "20PM",_endPoint: "21PM")
                        }.padding()
                    }
                }
                
                Circle()
                    .foregroundColor(.yellow)
                    .frame(width: 50,height: 50)
                    .overlay(
                        Image(systemName: "plus")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    )
                    .padding(.trailing,10)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
            }//ZStack
            // 상단의 navigationBar 부분의 공간이 낭비되므로 Hidden 메소드로
            // 없앨 수 있다. @State를 활용하여 해당 값을 감지하고 다시그리는 방식
            .navigationBarTitle("메모장")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear{
                self.isNavigationBarHidden = true
            }
        }//NavigationVIew
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
