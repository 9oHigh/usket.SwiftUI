//
//  TodayView.swift
//  SwiftUI-State,Binding,EnviromentObject
//
//  Created by 이경후 on 1/3/24.
//

import SwiftUI

struct BeforeBedView: View {
    
    @EnvironmentObject var viewModel: MyViewModel
    @Binding var count: Int
    @State var title: String = ""
    
    var body: some View {
        VStack {
            Text("\(title)")
                .fontWeight(.bold)
                .font(.system(size: 26))
                .padding()
            Text("자기전에 빡코딩! count: \(count)")
                .padding()
            Button {
                count += 1
                title = "빡코딩의 일상 \(count)일차"
            } label: {
                Text("카운트 업")
                    .padding()
                    .background(.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onReceive(viewModel.$appTitle) { title in
            self.title = title
        }
    }
}
