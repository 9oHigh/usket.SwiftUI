//
//  ContentView.swift
//  SwiftUI-State,Binding,EnviromentObject
//
//  Created by 이경후 on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    
    //ContentView의 하위뷰에서 모두 사용할 수 있도록, 공유할 수 있도록 만들어주는 어노테이션이다.
    @EnvironmentObject var viewModel: MyViewModel
    @State var count = 0
    @State var appTitle = "빡코딩의 일상"
    // var appTitle = "빡코딩의 일상" // -> Just variable
    
    var body: some View {
        TabView {
            VStack {
                Text("오늘도 빡코딩! count: \(count)")
                    .padding()
                Button {
                    count += 1
                    viewModel.appTitle = "빡코딩의 일상 \(count)일차"
                } label: {
                    Text("카운트 업")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            }
            .tabItem { Label("오늘도", systemImage: "pencil.circle") }
            
            BeforeBedView(count: $count)
                .tabItem { Label("자기전에", systemImage: "folder.fill") }
            
            WeeklyView(count: $count)
                .tabItem { Label("주말에도", systemImage: "paperplane.fill") }
        }
        .overlay(Text(appTitle).offset(y: -(UIScreen.main.bounds.height * 0.4)))
        .onReceive(viewModel.$appTitle) { appTitle in
            self.appTitle = appTitle
        }
    }
}

#Preview {
    ContentView()
}
