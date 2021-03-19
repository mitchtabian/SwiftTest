//
//  testApp.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

@main
struct testApp: App {
    
    let persistenceController = PersistenceController.bookworm

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, PersistenceController.bookworm.container.viewContext)
        }
    }
}
