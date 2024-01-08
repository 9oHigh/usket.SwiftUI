//
//  ContentView.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/7/24.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct Counter {
    
    struct State: Equatable {
        var count = 0
    }
    
    enum Action {
        case incrementButtonTapped
        case decrementButtonTapped
    }
    
    var body: some ReducerOf<Counter> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1
                return .none
            case .incrementButtonTapped:
                state.count += 1
                return .none
            }
        }
    }
}

struct CounterView: View {
    
    let counterStore: StoreOf<Counter>
    
    var body: some View {
        WithViewStore(self.counterStore, observe: { $0 }) { viewStore in
            VStack {
                HStack {
                  Button("−") { viewStore.send(.decrementButtonTapped) }
                  Text("\(viewStore.count)")
                  Button("+") { viewStore.send(.incrementButtonTapped) }
                }
            }
        }
    }
}

#Preview {
    CounterView(counterStore: Store(initialState: Counter.State()) {
        Counter()
    })
}
