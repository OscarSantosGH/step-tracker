//
//  ChartDataTypes.swift
//  StepTracker
//
//  Created by Oscar Santos on 7/10/24.
//

import Foundation

struct WeekdayChartData: Identifiable, Equatable {
    let id = UUID()
    let date: Date
    let value: Double
}
