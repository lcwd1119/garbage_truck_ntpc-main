//
//  garbage_truck_ntpcApp.swift
//  garbage_truck_ntpc
//
//  Created by 廖晨維 on 2021/12/24.
//

import SwiftUI

@main
struct garbage_truck_ntpcApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,
                              persistenceController.container.viewContext)
        }
    }
}
