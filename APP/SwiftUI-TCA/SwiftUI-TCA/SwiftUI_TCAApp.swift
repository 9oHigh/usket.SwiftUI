//
//  SwiftUI_TCAApp.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/7/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct SwiftUI_TCAApp: App {
    var body: some Scene {
        WindowGroup {
            CounterView(
                counterStore: Store(initialState: Counter.State()) {
                    Counter()
                }
            )
        }
    }
}
