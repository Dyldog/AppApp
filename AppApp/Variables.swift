//
//  Variables.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import Foundation

struct Variables {
    private var variables: [String: VariableValue]
    
    init() {
        variables = .init()
    }
    
    func value(for name: String) -> VariableValue? {
        variables[name]
    }
    
    mutating func set(_ value: VariableValue, for name: String) {
        variables[name] = value
    }
}
