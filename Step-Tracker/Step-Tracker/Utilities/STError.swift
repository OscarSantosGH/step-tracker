//
//  STError.swift
//  StepTracker
//
//  Created by Oscar Santos on 7/25/24.
//

import Foundation

enum STError: LocalizedError {
    case authNotDetermine
    case sharingDenied(quantityType: String)
    case noData
    case unableToCompleteRequest
    case invalidValue
    
    var errorDescription: String? {
        switch self {
        case .authNotDetermine:
            "Need Access to Health Data"
        case .sharingDenied(_):
            "No Write Access"
        case .noData:
            "No Data"
        case .unableToCompleteRequest:
            "Unable to Complete Request"
        case .invalidValue:
            "Invalid Value"
        }
    }
    
    var failureReason: String {
        switch self {
        case .authNotDetermine:
            "You have not given access to your Health data. Please go to Settings > Health > Data Access & Devices."
        case .sharingDenied(let quantityType):
            "You have denied access to upload your \(quantityType) data.\n\nYou can change this in Settings > Health > Data Access & Devices."
        case .noData:
            "There is no data for this Health statistic."
        case .unableToCompleteRequest:
            "We are unable to complete your request at this time.\n\nPlease try again later or contact support."
        case .invalidValue:
            "Must be a numeric value with a maximum of one decimal place."
        }
    }
}
