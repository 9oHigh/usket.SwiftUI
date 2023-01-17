//
//  ContentView.swift
//  SwfitUIImage
//
//  Created by 이경후 on 2021/08/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                Image("myBeachImage")
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(y: -90)
                CircleImageView()
                HStack{
                    NavigationLink(
                        destination: MyWebView(urlToLoad:
                        "https://www.youtube.com")
                            .edgesIgnoringSafeArea(.all)
                    ){
                        Text("구독")
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                    NavigationLink(
                        destination: MyWebView(urlToLoad:
                        "https://www.instagram.com")
                            .edgesIgnoringSafeArea(.all)
                    ){
                        Text("팔로우")
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(20)
                    }
                }//Hstack
                .padding(50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
