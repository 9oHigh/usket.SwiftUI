//
//  WeekendView.swift
//  SwiftUI-State,Binding,EnviromentObject
//
//  Created by 이경후 on 1/3/24.
//

import SwiftUI

struct WeeklyView: View {
    
    @EnvironmentObject var viewModel: MyViewModel
    @Binding var count: Int
    @State var title: String = ""
    
    init(count: Binding<Int> = .constant(99)) {
        _count = count
    }
    
    var body: some View {
        VStack {
            Text("\(title)")
                .fontWeight(.bold)
                .font(.system(size: 26))
                .padding()
            Text("주말에도 빡코딩! count: \(count)")
                .padding()
            Button {
                count += 1
                title = "빡코딩의 일상 \(count)일차"
            } label: {
                Text("카운트 업")
                    .padding()
                    .background(.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .onReceive(viewModel.$appTitle) { title in
            self.title = title
        }
    }
}

