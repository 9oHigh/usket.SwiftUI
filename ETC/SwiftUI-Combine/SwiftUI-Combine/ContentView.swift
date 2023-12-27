//
//  ContentView.swift
//  SwiftUI-combine
//
//  Created by 이경후 on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        List(randomUserViewModel.randomUsers) { randomUser in
            RandomUserRowView(randomUser: randomUser)
        }
    }
}

#Preview {
    ContentView()
}
