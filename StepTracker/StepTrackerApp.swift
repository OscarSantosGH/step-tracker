//
//  StepTrackerApp.swift
//  StepTracker
//
//  Created by Oscar Santos on 7/5/24.
//

import SwiftUI

@main
struct StepTrackerApp: App {
    
    let hkManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            DashboardView()
                .environment(hkManager)
        }
    }
}
