//
//  FoodZapApp.swift
//  Shared
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI
import Firebase

@main
struct FoodZapApp: App {
    @AppStorage("currentPage") var currentPage = 0
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            if currentPage == 4 {
                BottomTabView()
            } else {
                OnBoardingView(background: .green)
            }
        }
    }
}
