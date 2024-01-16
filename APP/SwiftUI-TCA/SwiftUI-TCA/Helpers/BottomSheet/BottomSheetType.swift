//
//  BottomSheetType.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/17/24.
//

import Foundation

enum BottomSheetType {
    
    enum BottomSheetResult {
        case fail
        case success
        
        var description: String {
            switch self {
            case .fail:
                return "실패했습니다 :("
            case .success:
                return "성공했습니다 :)"
            }
        }
    }
    case update(BottomSheetResult)
    case delete(BottomSheetResult)
    case add(BottomSheetResult)
    
    var title: String {
        switch self {
        case .update:
            return "메모 업데이트 안내"
        case .delete:
            return "메모 삭제 안내"
        case .add:
            return "메모 추가 안내"
        }
    }
    
    var message: String {
        switch self {
        case .update(let type):
            return "업데이트에 \(type.description)"
        case .delete(let type):
            return "삭제에 \(type.description)"
        case .add(let type):
            return "새로운 메모 추가에 \(type.description)"
        }
    }
}
