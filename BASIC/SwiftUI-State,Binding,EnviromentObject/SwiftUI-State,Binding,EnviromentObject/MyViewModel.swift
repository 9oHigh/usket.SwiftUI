//
//  MyViewModel.swift
//  SwiftUI-State,Binding,EnviromentObject
//
//  Created by 이경후 on 1/3/24.
//

import SwiftUI
import Combine

final class MyViewModel: ObservableObject {
    @Published var appTitle: String = "빡코딩의 일상"
}
