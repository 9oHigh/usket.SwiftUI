//
//  ExtensionColor.swift
//  SwiftUI-ToastAndPopup
//
//  Created by 이경후 on 2021/09/09.
//

import Foundation
import SwiftUI

extension Color {
    //생성자
    init(hexcode: String){
        let scanner = Scanner(string: hexcode)
        var rgbValue : UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff
        
        self.init(red: Double(red) / 0xff, green:Double(green) / 0xff, blue: Double(blue) / 0xff)
    }
}
