//
//  MemoEditor.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/16/24.
//

import Foundation
import SwiftUI
import ComposableArchitecture

enum MemoEditType {
    case update
    case add
}

struct MemoEditor: View {
    
    @Environment(\.dismiss) private var dismiss
    private var memo: Memo?
    private var memoEditType: MemoEditType
    private var onSave: (Memo) -> Void
    @State private var title: String = "제목을 입력해주세요."
    @State private var description: String = "내용을 입력해주세요."
    
    init(memo: Memo?, memoEditType: MemoEditType, onSave: @escaping (Memo) -> Void) {
        self.memo = memo
        self.memoEditType = memoEditType
        self.onSave = onSave
    }
    
    var body: some View {
        
        NavigationStack {
            
            TextField(title, text: $title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.black)
                .lineLimit(1)
            
            Divider()
            
            TextField(description, text: $description, axis: .vertical)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(.black)
                .lineLimit(10)
                .toolbar {
                    Button {
                        if let memo = memo {
                            onSave(Memo(id: memo.id, title: title, description: description, date: Date()))
                        } else {
                            onSave(Memo(id: UUID(), title: title, description: description, date: Date()))
                        }
                        dismiss()
                    } label: {
                        Text("저장하기")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundStyle(.black)
                    }
                }
            
            Spacer()
        }
        .background(.white)
        .padding()
        .onAppear {
            guard let memo = memo else { return }
            title = memo.title
            description = memo.description
        }
    }
}
