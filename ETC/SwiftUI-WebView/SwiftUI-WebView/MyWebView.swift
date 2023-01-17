//
//  MyWebView.swift
//  SwfitWebView
//
//  Created by 이경후 on 2021/08/17.
//

import SwiftUI
import WebKit

// UIkit의 UIView를 사용할 수 있도록 하는 구조체
// UIViewControllerRepresentable

struct MyWebView: UIViewRepresentable {
    // url을 입력받을 변수
    var urlToLoad: String
    
    // UI View 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        // Unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        //웹뷰 인스턴스 생성
        let webView = WKWebView()
        
        webView.load(URLRequest(url: url))
            
        return webView
    }
    // 업데이트 UI View
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<MyWebView>) {
        
    }
}



struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://www.naver.com")
    }
}
