//
//  ContentView.swift
//  SwiftUI-ScrollPage
//
//  Created by 이경후 on 2021/08/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            
            VStack(alignment:.leading,spacing: 0){
                
                HStack{
                    
                    Image(systemName: "line.horizontal.3")
                        .font(.largeTitle)
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
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
