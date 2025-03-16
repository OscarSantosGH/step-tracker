//
//  Step_TrackerApp.swift
//  Step-Tracker
//
//  Created by Oscar Santos on 3/16/25.
//

import SwiftUI

@main
struct Step_TrackerApp: App {
    let hkData = HealthKitData()
    let hkManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(hkData)
                .environment(hkManager)
        }
    }
}
