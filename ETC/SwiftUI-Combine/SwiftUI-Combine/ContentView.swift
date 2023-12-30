//
//  ContentView.swift
//  SwiftUI-combine
//
//  Created by 이경후 on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var randomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        List(randomUserViewModel.randomUsers) { randomUser in
            RandomUserRowView(randomUser: randomUser)
                .onAppear {
                    if self.randomUserViewModel.randomUsers.last == randomUser {
                        // 로드 중에 호출할 가능성이 다분함
                        randomUserViewModel.fetchMoreUsers()
                    }
                }
        }
        .listStyle(.plain)
        .refreshable {
            randomUserViewModel.fetchRandomUsers()
        }
        
        if randomUserViewModel.isLoading {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.yellow)
                .scaleEffect(1.7, anchor: .center)
        }
    }
}

#Preview {
    ContentView()
}
