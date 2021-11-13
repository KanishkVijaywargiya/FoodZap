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
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack {
                    HomeView()
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        .foregroundColor(.black)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
