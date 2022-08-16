//
//  SegmentLayoutView.swift
//  SwiftUI-lazyVgrid
//
//  Created by Luxrobo on 2022/08/16.
//

import Foundation
import SwiftUI

enum LayoutType: CaseIterable {
    case table
    case grid
    case multiple
}

extension LayoutType {
    // 레이아웃 타입에 대한 컬럼 설정을 위한 변수
    var columns: [GridItem] {
        switch self {
        case .table:
            return [GridItem(.flexible())]
        case .grid:
            return [
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
        case .multiple:
            return [
                GridItem(.adaptive(minimum: 100))
            ]
        }
    }
}

struct SegmentLayoutView: View {
    
    var dummyData = MyModel.dummyDataArray
    @State var selectedLayoutType: LayoutType = .table
    
    var body: some View {
        VStack {
            Picker(selection: $selectedLayoutType) {
                ForEach(LayoutType.allCases, id: \.self) { layoutType in
                    switch layoutType {
                    case .table:
                        Image(systemName: "list.dash")
                    case .grid:
                        Image(systemName: "square.grid.2x2.fill")
                    case .multiple:
                        Image(systemName: "circle.grid.3x3.fill")
                    }
                }
            } label: {
                Text("Layout Type")
                Text("Layout Type")
                Text("Layout Type")
            }
            .frame(width: 250)
            .pickerStyle(SegmentedPickerStyle())
            
            ScrollView {
                LazyVGrid(columns: selectedLayoutType.columns, content: {
                    ForEach(dummyData) { item in
                        switch selectedLayoutType {
                        case .table:
                            Rectangle().frame(height: 100)
                                .foregroundColor(.red)
                        case .grid:
                            Rectangle().frame(height: 100)
                                .foregroundColor(.blue)
                        case .multiple:
                            Rectangle().frame(height: 100)
                                .foregroundColor(.green)
                        }
                    }
                })
                .animation(.easeInOut)
                .padding(.horizontal, 10)
            }
        }
    }
}

struct SegmentLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentLayoutView()
    }
}
