//
//  ContentView.swift
//  CounterApp
//
//  Created by Luxrobo on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text("Current Count: \(count)")
                    .font(.largeTitle)
                
                HStack(alignment: .center) {
                    Button(action: { count -= 1 }) {
                        Image(systemName: "minus.circle")
                    }
                    .padding()
                    .foregroundColor(.black)

                    Button(action: { count += 1 }){
                        Image(systemName: "plus.circle")
                    }
                    .padding()
                    .foregroundColor(.black)
                }
                
                Button(action: { count = 0 }) {
                    Text("RESET")
                        .padding()
                }
                .background(Color.black)
                .font(.body)
                .foregroundColor(.white)
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
