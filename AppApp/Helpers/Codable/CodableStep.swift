//
//  CodableStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Foundation
import Armstrong

struct CodableStep {
    enum CodingKeys: String, CodingKey {
        case type
        case value
    }
    
    let value: any StepType
    let type: String
    
    init(value: any StepType) {
        self.value = value
        self.type = typeString(Swift.type(of: value))
    }
}
