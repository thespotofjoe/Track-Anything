//
//  Track_AnythingApp.swift
//  Shared
//
//  Created by Joe Buchoff on 12/1/21.
//

import SwiftUI

@main
struct Track_AnythingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
