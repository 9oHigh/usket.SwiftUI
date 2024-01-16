//
//  Memos.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/16/24.
//

import Foundation
import ComposableArchitecture

struct Memos: Reducer {
    
    struct State: Equatable {
        var memos: [Memo] = []
        var searchedMemos: [Memo] = []
        var selectedMemo: Memo? = nil
    }
    
    enum Action: Equatable {
        case findAllMemo
        case findMemo(_ content: String)
        case addMemo(_ memo: Memo)
        case deleteMemo(_ id: UUID)
        case updateMemo(id: UUID, title: String, description: String)
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .findAllMemo:
                return .none
            case .findMemo(let content):
                state.searchedMemos = state.memos.filter { $0.description.contains("\(content)") || $0.title.contains("\(content)") }
                return .none
            case .addMemo(let memo):
                state.memos.append(memo)
                return .none
            case .deleteMemo(let id):
                state.memos = state.memos.filter { $0.id != id }
                return .none
            case .updateMemo(id: let id, title: let title, description: let description):
                if let index = state.memos.firstIndex(where: { $0.id == id }) {
                    state.memos[index].title = title
                    state.memos[index].description = description
                    state.memos[index].date = Date()
                }
                return .none
            }
        }
    }
}
