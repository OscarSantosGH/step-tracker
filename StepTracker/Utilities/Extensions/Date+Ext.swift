//
//  Date+Ext.swift
//  StepTracker
//
//  Created by Oscar Santos on 7/10/24.
//

import Foundation

extension Date {
    var weekdayInt: Int {
        Calendar.current.component(.weekday, from: self)
    }
    
    var weekdayTitle: String {
        self.formatted(.dateTime.weekday(.wide))
    }
    
    var accessibilityDate: String {
        self.formatted(.dateTime.weekday(.wide).day())
    }
}
