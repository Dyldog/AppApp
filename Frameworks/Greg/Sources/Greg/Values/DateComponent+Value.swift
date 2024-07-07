//
//  File.swift
//  
//
//  Created by Dylan Elliott on 18/12/2023.
//

import Foundation
import Armstrong

extension Calendar.Component: PickableValue {
    public static var defaultValue: Calendar.Component { .weekOfYear }
    
    public static var allCases: [Calendar.Component] { [
        .era,
        .year,
        .month,
        .day,
        .hour,
        .minute,
        .second,
        .weekday,
        .weekdayOrdinal,
        .quarter,
        .weekOfMonth,
        .weekOfYear,
        .yearForWeekOfYear,
        .nanosecond,
        .calendar,
        .timeZone,
    ] }
    
    public var title: String {
        switch self {
        case .era: return "era"
        case .year: return "year"
        case .month: return "month"
        case .day: return "day"
        case .hour: return "hour"
        case .minute: return "minute"
        case .second: return "second"
        case .weekday: return "weekday"
        case .weekdayOrdinal: return "weekdayOrdinal"
        case .quarter: return "quarter"
        case .weekOfMonth: return "weekOfMonth"
        case .weekOfYear: return "weekOfYear"
        case .yearForWeekOfYear: return "yearForWeekOfYear"
        case .nanosecond: return "nanosecond"
        case .calendar: return "calendar"
        case .timeZone: return "timeZone"
        case .isLeapMonth: return "isLeapMonth"
        @unknown default: return "UNKNOWN!"
        }
    }
    
    public var codeRepresentation: String {
        "Calendar.Component.\(title)"
    }
    
    
}
