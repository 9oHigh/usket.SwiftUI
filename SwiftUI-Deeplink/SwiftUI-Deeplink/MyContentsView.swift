//
//  MyContentsView.swift
//  SwiftUI-Deeplink
//
//  Created by 이경후 on 2021/09/15.
//

import Foundation
import SwiftUI

struct MyContentsView : View {
    @State private var myContent : String
    
    init(contents : String) {
        myContent = contents
    }
    var body: some View{
        VStack{
            Text(myContent)
        }
    }
}

struct MyContentsView_Previews: PreviewProvider {
    static var previews: some View {
        MyContentsView(contents: "바보")
    }
}
