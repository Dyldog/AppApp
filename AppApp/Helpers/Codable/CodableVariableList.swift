//
//  CodableVariableList.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Armstrong
import Foundation

struct CodableVariableList: Codable {
    let variables: [CodableVariableValue]
    var values: [any EditableVariableValue] { variables.map { $0.value } }

    init(variables: [CodableVariableValue]) {
        self.variables = variables
    }

    init(variables: [any EditableVariableValue]) {
        self.variables = variables.map { .init(value: $0) }
    }
}
