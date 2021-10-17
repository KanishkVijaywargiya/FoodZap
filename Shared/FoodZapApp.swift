//
//  FoodZapApp.swift
//  Shared
//
//  Created by KANISHK VIJAYWARGIYA on 17/10/21.
//

import SwiftUI

@main
struct FoodZapApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
