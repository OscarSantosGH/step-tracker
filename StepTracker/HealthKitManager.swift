//
//  HealthKitManager.swift
//  StepTracker
//
//  Created by Oscar Santos on 7/8/24.
//

import Foundation
import HealthKit
import Observation

@Observable
class HealthKitManager {
    let store = HKHealthStore()
    let types: Set = [HKQuantityType(.stepCount), HKQuantityType(.bodyMass)]
}
