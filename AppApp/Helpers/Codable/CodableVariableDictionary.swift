//
//  CodableVariableDictionary.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Foundation
import Armstrong

struct CodableVariableDictionary: Codable {
    let variables: [StringValue: CodableVariableValue]
    var values: [StringValue: any EditableVariableValue] { variables.mapValues { $0.value } }
    
    init(variables: [StringValue: CodableVariableValue]) {
        self.variables = variables
    }
    
    init(variables: [StringValue: any EditableVariableValue]) {
        self.variables = variables.mapValues { .init(value: $0) }
    }
}
