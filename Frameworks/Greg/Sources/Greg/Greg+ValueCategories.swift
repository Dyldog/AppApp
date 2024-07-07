//
//  File.swift
//  
//
//  Created by Dylan Elliott on 30/12/2023.
//

import Armstrong

public extension ValueCategoryGroup {
    static let dates: ValueCategoryGroup = .init(parent: .some(root), iconName: "timeline.selection", title: "Dates")
}

public extension ValueCategory {
    static let dates: ValueCategory = ValueCategoryGroup.dates.topLevel
    
    
    static let dateSteps: ValueCategory = .init(parent: .dates, iconName: "timeline.selection", title: "Steps")
    
}
