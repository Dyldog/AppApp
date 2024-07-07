//
//  CodableStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Armstrong
import Foundation

struct CodableStep {
    enum CodingKeys: String, CodingKey {
        case type
        case value
    }

    let value: any StepType
    let type: String

    init(value: any StepType) {
        self.value = value
        type = typeString(Swift.type(of: value))
    }
}
