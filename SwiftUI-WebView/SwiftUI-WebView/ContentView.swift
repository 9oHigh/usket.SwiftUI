//
//  ContentView.swift
//  SwfitWebView
//
//  Created by 이경후 on 2021/08/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            HStack{
                NavigationLink( destination: MyWebView(urlToLoad: "https://www.naver.com")
                                    .edgesIgnoringSafeArea(.top)
                ){
                    MyLinkView(_linkName: "Naver", _colorType: Color.green, _fontColor: Color.white)
                }
                NavigationLink( destination: MyWebView(urlToLoad: "https://www.daum.net")
                                    .edgesIgnoringSafeArea(.all)
                ){
                    MyLinkView(_linkName: "Daum", _colorType: Color.blue, _fontColor: Color.white)
                }
                NavigationLink( destination: MyWebView(urlToLoad: "https://www.google.com")
                                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                ){
                    MyLinkView(_linkName: "Google", _colorType: Color.red, _fontColor: Color.white)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
