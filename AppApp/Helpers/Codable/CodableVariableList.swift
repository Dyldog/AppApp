//
//  CodableVariableList.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Foundation

struct CodableVariableList: Codable {
    let variables: [CodableVariableValue]
    var values: [any VariableValue] { variables.map { $0.value } }
    
    init(variables: [CodableVariableValue]) {
        self.variables = variables
    }
    
    init(variables: [any VariableValue]) {
        self.variables = variables.map { .init(value: $0 as! (any EditableVariableValue)) }
    }
}
