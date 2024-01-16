//
//  NavigationBar+Modifier.swift
//  SwiftUI-TCA
//
//  Created by 이경후 on 1/16/24.
//

import SwiftUI

struct NavigationBarStyleModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                let navigationBarAppearance = UINavigationBarAppearance()
                let backButtonAppearance = UIBarButtonItemAppearance()
                let backButtonImage = UIImage(systemName: "chevron.backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
                
                navigationBarAppearance.titleTextAttributes = [
                    NSAttributedString.Key.foregroundColor : UIColor.black,
                    NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)
                ]
                backButtonAppearance.normal.titleTextAttributes = [
                    NSAttributedString.Key.foregroundColor : UIColor.black
                ]
                navigationBarAppearance.backButtonAppearance = backButtonAppearance
                navigationBarAppearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
                UINavigationBar.appearance().standardAppearance = navigationBarAppearance
                UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
                UINavigationBar.appearance().compactAppearance = navigationBarAppearance
                UINavigationBar.appearance().compactScrollEdgeAppearance = navigationBarAppearance
            }
    }
}
