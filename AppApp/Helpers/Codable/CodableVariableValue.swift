//
//  CodableVariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Armstrong
import Foundation

struct CodableVariableValue {
    let type: String
    let value: any EditableVariableValue

    init(value: any EditableVariableValue) {
        self.value = value
        type = typeString(Swift.type(of: value))
    }
}
