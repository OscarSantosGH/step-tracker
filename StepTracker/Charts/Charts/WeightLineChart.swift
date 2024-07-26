//
//  WeightLineChart.swift
//  StepTracker
//
//  Created by Oscar Santos on 7/10/24.
//

import SwiftUI
import Charts

struct WeightLineChart: View {
    @State private var rawSelectedDate: Date?
    @State private var selectedDay: Date?
    
    var chartData: [DateValueChartData]
    
    var selectedData: DateValueChartData? {
        ChartHelper.parseSelectedData(from: chartData, in: rawSelectedDate)
    }
    
    var minValue: Double {
        chartData.map { $0.value }.min() ?? 0
    }
    
    var average: Double {
        chartData.map{$0.value}.average
    }
    
    var body: some View {
        ChartContainer(chartType: .weightLine(average: average)) {
            Chart {
                if let selectedData {
                    ChartAnnotationView(data: selectedData, context: .weight)
                }
                
                ForEach(chartData) { weight in
                    if !chartData.isEmpty {
                        RuleMark(y: .value("Goal", 160))
                            .foregroundStyle(.mint)
                            .lineStyle(.init(lineWidth: 1, dash: [5]))
                    }
                    AreaMark(
                        x: .value("Day", weight.date, unit: .day),
                        yStart: .value("Value", weight.value),
                        yEnd: .value("Min Value", minValue)
                    )
                    .foregroundStyle(Gradient(colors: [.indigo.opacity(0.5), .clear]))
                    .interpolationMethod(.catmullRom)
                    
                    LineMark(
                        x: .value("Day", weight.date, unit: .day),
                        y: .value("Value", weight.value)
                    )
                    .foregroundStyle(.indigo)
                    .interpolationMethod(.catmullRom)
                    .symbol(.circle)
                }
            }
            .frame(height: 150)
            .chartXSelection(value: $rawSelectedDate)
            .chartYScale(domain: .automatic(includesZero: false))
            .chartXAxis {
                AxisMarks {
                    AxisValueLabel(format: .dateTime.month(.defaultDigits).day())
                }
            }
            .chartYAxis {
                AxisMarks { value in
                    AxisGridLine()
                        .foregroundStyle(Color.secondary.opacity(0.3))
                    AxisValueLabel()
                }
            }
            .overlay {
                if chartData.isEmpty {
                    ChartEmptyView(systemImageName: "chart.line.downtrend.xyaxis", title: "No Data", description: "There is no weight data from the Health App")
                }
            }
        }
        .sensoryFeedback(.selection, trigger: selectedDay)
        .onChange(of: rawSelectedDate) { oldValue, newValue in
            if oldValue?.weekdayInt != newValue?.weekdayInt {
                selectedDay = newValue
            }
        }
    }
}

#Preview {
    WeightLineChart(chartData: ChartHelper.convert(data: MockData.weights))
}
