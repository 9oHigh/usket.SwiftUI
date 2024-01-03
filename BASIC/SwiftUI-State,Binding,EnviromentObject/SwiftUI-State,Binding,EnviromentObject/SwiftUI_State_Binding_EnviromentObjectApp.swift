//
//  SwiftUI_State_Binding_EnviromentObjectApp.swift
//  SwiftUI-State,Binding,EnviromentObject
//
//  Created by 이경후 on 1/3/24.
//

import SwiftUI

@main
struct SwiftUI_State_Binding_EnviromentObjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(MyViewModel())
            // ObservableObject 생성자 x
            // enviromentObject(객체)
        }
    }
}
