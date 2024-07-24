//
//  ChartContainer.swift
//  StepTracker
//
//  Created by Oscar Santos on 7/24/24.
//

import SwiftUI

struct ChartContainerConfiguration {
    let title: String
    let symbol: String
    let subTitle: String
    let context: HealthMetricContext
    let isNav: Bool
}

struct ChartContainer<Content: View>: View {
    let config: ChartContainerConfiguration
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading) {
            if config.isNav {
                NavigationLinkView
            } else {
                titleView
                    .foregroundStyle(.secondary)
                    .padding(.bottom, 12)
            }
            
            content()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.secondarySystemBackground)))
        
    }
    
    var NavigationLinkView: some View {
        NavigationLink(value: config.context) {
            HStack {
                titleView
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .foregroundStyle(.secondary)
        .padding(.bottom, 12)
    }
    
    var titleView: some View {
        VStack(alignment: .leading) {
            Label(config.title, systemImage: config.symbol)
                .font(.title3.bold())
                .foregroundStyle(config.context == .steps ? .pink : .indigo)
            
            Text(config.subTitle)
                .font(.caption)
        }
    }
}

#Preview {
    ChartContainer(config: .init(title: "Test Title", symbol: "figure.walk", subTitle: "Test subtitle", context: .steps, isNav: true)) {
        Text("Chart Goes Here")
            .frame(minHeight: 150)
    }
}
