//
//  Variables.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import Foundation

struct Variables: Equatable {
    private(set) var variables: [String: VariableValue]
    
    var keys: [String] { Array(variables.keys) }
    
    init() {
        variables = .init()
    }
    
    func value(for name: String) -> VariableValue? {
        variables[name]
    }
    
    mutating func set(_ value: VariableValue, for name: String) {
        variables[name] = value
    }
    
    mutating func set(from other: Variables) {
        for (key, value) in other.variables {
            if self.value(for: key)?.valueString != value.valueString {
                set(value, for: key)
            }
        }
    }
    
    static func == (lhs: Variables, rhs: Variables) -> Bool {
        func keyString(_ vars: Variables) -> String {
            vars.keys.sorted().joined()
        }
        
        func valueString(_ vars: Variables) -> String {
            vars.variables.values.map { $0.valueString }.sorted().joined()
        }
        
        return keyString(lhs) == keyString(rhs) && valueString(lhs) == valueString(rhs)
    }
}
