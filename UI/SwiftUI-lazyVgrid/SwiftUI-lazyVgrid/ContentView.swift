//
//  ContentView.swift
//  SwiftUI-lazyVgrid
//
//  Created by 이경후 on 2021/09/17.
//

import SwiftUI

struct MyModel: Identifiable {
    let id = UUID()
    let title: String
    let content: String
}
extension MyModel {

    static var dummyDataArray: [MyModel] {
        (1...2000).map { (number: Int) in
            MyModel(title: "타이틀: \(number)", content: "Content: \(number)")
        }
    }
}

struct ContentView: View {
    
    var dummyDataArray = MyModel.dummyDataArray
    
    var body: some View {
        
        ScrollView {
            // columns는 Horizontal 아이템들의 레이아웃을 설정하는 부분
            // Options : fixed, adaptive
            // fixed: 고정
            // adaptive: 공간이 허용될 때까지 최솟값부터 최댓값까지 계산해서 분할로 채우기 ( 여러개 )
            // flexible: 공간이 허용될 때까지 최솟값부터 최댓값까지 계산해서 분할로 채우기 ( 하나만 )
            LazyVGrid(columns: [GridItem(.fixed(200)), GridItem(.adaptive(minimum: 50, maximum: 100)), GridItem(.flexible(minimum: 50, maximum: 100))], spacing: 40, content: {
                ForEach(dummyDataArray) { item in
                    Rectangle().foregroundColor(.blue)
                        .frame(height: 120)
                        .overlay(
                            Text("\(item.title)")
                        )
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
