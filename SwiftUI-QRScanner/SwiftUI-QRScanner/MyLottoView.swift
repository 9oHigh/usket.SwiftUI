//
//  MyLottoView.swift
//  SwiftUI-QRScanner
//
//  Created by 이경후 on 2021/08/26.
//

import SwiftUI
import WebKit

struct MyLottoView : UIViewRepresentable{
    
    var urlToLoad: String
    
    func makeUIView(context : Context) -> WKWebView {
        
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        let webView = WKWebView()
        
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView,context: UIViewRepresentableContext<MyLottoView>){
        
    }
    
    
}


struct MyLottoView_Previews: PreviewProvider {
    static var previews: some View {
        MyLottoView(urlToLoad: "https://www.naver.com")
    }
}
