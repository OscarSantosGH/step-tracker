//
//  HealthMetric.swift
//  StepTracker
//
//  Created by Oscar Santos on 7/9/24.
//

import Foundation

struct HealthMetric: Identifiable {
    let id = UUID()
    let date: Date
    let value: Double
}
