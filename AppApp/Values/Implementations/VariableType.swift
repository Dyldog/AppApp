//
//  VariableType.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

enum VariableType: Int, VariableValue, CaseIterable {
    case type
    case value
    case string
    case int
    case variable
    case action
    
    var protoString: String {
        switch self {
        case .type: return "Type"
        case .value: return "Value"
        case .string: return "String"
        case .int: return "Int"
        case .variable: return "Variable"
        case .action: return "Action"
        }
    }
    
    var defautltView: VariableValue {
        switch self {
        case .type: return VariableType.string
        case .string: return "TEXT"
        case .int: return 69
        case .variable: return Variable(name: "VAR")
        case .action: return ActionValue(steps: [])
        case .value: return Value(value: "TEXT")
        }
    }
    
    func string(with variables: inout Variables) -> String { protoString }
    
    func value(from string: String) -> VariableValue? {
        switch self {
        case .type: fatalError()
        case .int: return Int(string)
        case .string: return string
        case .variable: return Variable(name: string)
        case .action: fatalError()
        case .value: fatalError()
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.wrongTypeForOperation
    }
    
    func editView(title: String, onUpdate: @escaping (VariableType) -> Void) -> AnyView {
        Picker("Type", selection: .init(get: {
            self
        }, set: { new in
            onUpdate(new)
        })) {
            ForEach(VariableType.allCases) {
                Text($0.protoString).tag($0)
            }
        }.pickerStyle(.segmented).any
    }
}
