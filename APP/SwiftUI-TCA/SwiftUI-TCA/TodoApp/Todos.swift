//
//  Todos.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/9/24.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct Todos {
    
    struct State: Equatable {
        var todos: IdentifiedArrayOf<Todo.State> = []
    }
    
    enum Action: BindableAction, Sendable {
        case addTodoButtonTapped
        case binding(BindingAction<State>)
        case clearCompletedButtonTapped
        case sortCompletedTodos
        case todos(IdentifiedActionOf<Todo>)
    }
    
    @Dependency(\.uuid) var uuid
    
    var body: some Reducer<State, Action> {
        
        BindingReducer()

        Reduce { state, action in
            switch action {
            case .addTodoButtonTapped:
                state.todos.insert(Todo.State(id: self.uuid()), at: 0)
                return .none
            case .binding:
                return .none
            case .clearCompletedButtonTapped:
                state.todos.removeAll(where: \.isCompleted)
                return .none
            case .sortCompletedTodos:
                state.todos.sort { $1.isCompleted && !$0.isCompleted }
                return .none
            case .todos:
                return .none
            }
        }
        .forEach(\.todos, action: \.todos) {
            Todo()
        }
    }
}

struct AppView: View {
    
    let store: StoreOf<Todos>
    
    struct ViewState: Equatable {
        let isClearCompletedButtonDisabled: Bool
        var todos = IdentifiedArrayOf<Todo.State>()
        
        init(store: BindingViewStore<Todos.State>) {
            self.isClearCompletedButtonDisabled = !store.todos.contains(where: \.isCompleted)
            self.todos = store.todos
        }
    }
    
    var body: some View {
        WithViewStore(self.store, observe: ViewState.init ) { viewStore in
            NavigationStack {
                List {
                    ForEachStore(self.store.scope(state: \.todos, action: \.todos)) { store in
                        TodoView(store: store)
                    }
                }
                .onChange(of: viewStore.todos) { _, _ in
                    viewStore.send(.sortCompletedTodos)
                }
                .toolbar {
                    HStack(spacing: 20) {
                        Button("Clear Completed") {
                            viewStore.send(.clearCompletedButtonTapped, animation: .default)
                        }
                        .disabled(viewStore.isClearCompletedButtonDisabled)
                        
                        Button("Add Todo") {
                            viewStore.send(.addTodoButtonTapped, animation: .default)
                        }
                    }
                }
            }
            .navigationTitle("Todos")
        }
    }
}

extension IdentifiedArray where ID == Todo.State.ID, Element == Todo.State {
  static let mock: Self = [
    Todo.State(
        id: UUID(), isCompleted: false,
        description: "Check Mail"
    ),
    Todo.State(
        id: UUID(), isCompleted: false,
        description: "Buy Milk"
    ),
    Todo.State(
        id: UUID(), isCompleted: true,
        description: "Call Mom"
    ),
  ]
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(
      store: Store(initialState: Todos.State(todos: .mock)) {
        Todos()
      }
    )
  }
}
