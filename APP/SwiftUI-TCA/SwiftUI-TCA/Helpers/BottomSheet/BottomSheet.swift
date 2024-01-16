//
//  BottomSheet.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/16/24.
//

import SwiftUI

struct BottomSheet: View {

    @Binding var isShowing: Bool
    @Binding var bottomSheetType: BottomSheetType
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture { isShowing.toggle() }
                
                BottomSheetMessageView(bottomSheetType: $bottomSheetType)
                    .setRoundedCorner(radius: 12)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
    }
}
