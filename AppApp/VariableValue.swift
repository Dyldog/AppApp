//
//  VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 20/11/2023.
//

import Foundation
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

protocol VariableValue {
    static var type: VariableType { get }
    func add(_ other: VariableValue) throws -> VariableValue
    var protoString: String { get }
    func string(with variables: inout Variables) throws -> String
    func editView(title: String, onUpdate: @escaping (Self) -> Void) -> AnyView
}

extension VariableValue {
    func editView(onUpdate: @escaping (Self) -> Void) -> AnyView {
        editView(title: "Edit", onUpdate: onUpdate)
    }
}

enum VariableValueError: Error {
    case wrongTypeForOperation
    case valueNotFoundForVariable
}

extension Int: VariableValue {
    static var type: VariableType { .int }
    
    func editView(title: String, onUpdate: @escaping (Int) -> Void) -> AnyView {
        TextField("", text: .init(get: {
            self.protoString.components(separatedBy: .decimalDigits.inverted).joined()
        }, set: {
            onUpdate(Int($0)!)
        })).any
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? Int else { throw VariableValueError.wrongTypeForOperation }
        return self + other
    }
    
    var protoString: String { "\(self)" }
    func string(with variables: inout Variables) -> String { protoString }
}

struct Variable: VariableValue {
    static var type: VariableType { .variable }
    var name: VariableValue
    
    func add(_ other: VariableValue) throws -> VariableValue {
//        guard let name = name else { throw VariableValueError.valueNotFoundForVariable }
        return try name.add(other)
    }
    
    var protoString: String { name.protoString }
    
    func string(with variables: inout Variables) throws -> String {
        try variables.value(for: try name.string(with: &variables))?.string(with: &variables) ?? "ERROR"
    }
    
    func editView(title: String, onUpdate: @escaping (Variable) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Text("Edit") }) {
                EditVariableView(value: name) {
                    onUpdate(.init(name: $0))
                }
            }
        }.any
    }
}

struct Value: VariableValue, ExpressibleByStringLiteral {
    
    static var type: VariableType { .value }
    var value: VariableValue
    
    init(value: VariableValue) {
        self.value = value
    }
    
    init(stringLiteral value: String) {
        self.init(value: value)
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        return try value.add(other)
    }
    
    var protoString: String { value.protoString }
    
    func string(with variables: inout Variables) throws -> String {
        try value.string(with: &variables)
    }
    
    func editView(title: String, onUpdate: @escaping (Value) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Text("Edit") }) {
                EditVariableView(value: value) {
                    onUpdate(.init(value: $0))
                }
            }
        }.any
    }
}
