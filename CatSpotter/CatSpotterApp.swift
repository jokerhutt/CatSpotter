//
//  CatSpotterApp.swift
//  CatSpotter
//
//  Created by David Glogowski on 30/04/2026.
//

import SwiftUI
import CoreData

@main
struct CatSpotterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
