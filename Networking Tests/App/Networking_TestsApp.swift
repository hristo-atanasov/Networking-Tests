//
//  Networking_TestsApp.swift
//  Networking Tests
//
//  Created by Hristo Atanasov on 3.01.25.
//

import SwiftUI

@main
struct Networking_TestsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
