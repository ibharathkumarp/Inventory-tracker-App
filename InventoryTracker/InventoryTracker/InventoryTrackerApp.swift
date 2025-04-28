//
//  InventoryTrackerApp.swift
//  InventoryTracker
//
//  Created by Bharath Kumar Potham Shetti on 4/25/25.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore





@main
struct InventoryTrackerApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
