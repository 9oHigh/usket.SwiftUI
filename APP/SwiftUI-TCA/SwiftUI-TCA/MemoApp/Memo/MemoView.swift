//
//  MemoView.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/16/24.
//

import SwiftUI

struct MemoView: View {
    
    var memo: Memo
    
    init(memo: Memo) {
        self.memo = memo
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 12) {
                Text(memo.title)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(2)
                    .foregroundStyle(.white)
                Text(memo.description)
                    .font(.system(size: 16, weight: .regular))
                    .lineLimit(2)
                    .foregroundStyle(.white)
            }
            .padding()
            .background(.black)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(.black)
        .cornerRadius(12)
    }
}
