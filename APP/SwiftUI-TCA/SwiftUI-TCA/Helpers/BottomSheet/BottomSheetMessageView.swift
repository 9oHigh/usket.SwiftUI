//
//  BottomSheetMessageView.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/17/24.
//

import SwiftUI

struct BottomSheetMessageView: View {
    
    @Binding var bottomSheetType: BottomSheetType
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            Text(bottomSheetType.title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.black)
            
            Text(bottomSheetType.message)
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(.black)
        }
        .frame(maxWidth: .infinity, minHeight: 150)
        .background(.white)
    }
}
