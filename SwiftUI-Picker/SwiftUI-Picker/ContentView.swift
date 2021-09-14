//
//  ContentView.swift
//  SwiftUI-Picker
//
//  Created by 이경후 on 2021/09/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectionValue = 0
    let Colors = ["빨간색","초록색","파란색"]
    let myColorBox : [Color] = [Color.red,Color.green,Color.blue]
    
    var body: some View {
        
        VStack{
            Circle()
                .frame(width: 60, height: 60, alignment: .center)
                .foregroundColor(myColorBox[selectionValue])
            
            Text("세그먼트 value. : \(selectionValue)")
            Text("선택된 색깔 : \(Colors[selectionValue])")
            
            Picker(selection: $selectionValue,
                   label: Text(""),
                   content: {
                    Text("레드").tag(0)
                    Text("그린").tag(1)
                    Text("블루").tag(2)
                   })
                .pickerStyle(SegmentedPickerStyle())
            
            Picker(selection: $selectionValue,
                   label: Text(""),
                   content: {
                    Text("레드").tag(0)
                    Text("그린").tag(1)
                    Text("블루").tag(2)
                   })
                .overlay(
                    Rectangle()
                        .stroke(lineWidth: 10)
                        .frame(width: 100, height: 150, alignment: .center)
                        .foregroundColor(myColorBox[selectionValue])
                )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //        ContentView(myColor: Color.blue)
        ContentView()
    }
}
