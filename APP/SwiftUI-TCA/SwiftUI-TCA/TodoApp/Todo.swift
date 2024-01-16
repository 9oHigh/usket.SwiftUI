//
//  Todo.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/9/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct Todo {
    struct State: Equatable, Identifiable {
        let id: UUID
        @BindingState var isCompleted: Bool = false
        @BindingState var description: String = ""
    }
    
    enum Action: BindableAction, Sendable {
        case binding(BindingAction<State>)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
    }
}

struct TodoView: View {
    
    let store: StoreOf<Todo>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack {
                Button {
                    viewStore.$isCompleted.wrappedValue.toggle()
                } label: {
                    Image(systemName: viewStore.isCompleted ? "checkmark.square" : "square")
                }
                .buttonStyle(.plain)
                
                TextField("내용을 작성해주세요.", text: viewStore.$description)
            }
            .foregroundStyle(viewStore.isCompleted ? .gray : .black)
        }
    }
}
