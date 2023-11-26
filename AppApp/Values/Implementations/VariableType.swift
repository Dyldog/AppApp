//
//  VariableType.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

enum VariableType: Int, VariableValue, CaseIterable, Equatable, Codable {
    case type
    case value
    case string
    case int
    case variable
//    case action
    case list
//    case dictionary
//    case temporary
    case fontWeight
    case boolean
    
    case label
    case stack
    
    var protoString: String {
        switch self {
        case .type: return "Type"
        case .value: return "Value"
        case .string: return "String"
        case .int: return "Int"
        case .variable: return "Variable"
//        case .action: return "Action"
        case .list: return "List"
//        case .dictionary: return "Dictionary"
//        case .temporary: return "Temporary"
        case .fontWeight: return "Font Weight"
        case .boolean: return "Boolean"
        case .label: return "Label"
        case .stack: return "Stack"
        }
    }
    
    // TODO: Move to each implementation
    var defautltView: VariableValue {
        switch self {
        case .type: return VariableType.string
        case .string: return StringValue(value: "TEXT")
        case .int: return IntValue(value: 69)
        case .variable: return Variable(name: StringValue(value: "VAR"))
//        case .action: return ActionValue(steps: [])
        case .value: return Value(value: StringValue(value: "TEXT"))
        case .list:  return ArrayValue(type: .string, elements: [])
//        case .dictionary: return DictionaryValue(type: .string, elements: [:])
//        case .temporary: return TemporaryValue(initial: StringValue(value: "TEXT"), output: .init(name: StringValue(value: "FIELDTEXT")))
        case .fontWeight: return FontWeightValue(value: .regular)
        case .boolean: return BoolValue(value: false)
        case .label: return MakeableLabel(
            text: .init(value: StringValue(value: "TEXT")),
            fontSize: .init(value: 18),
            fontWeight: .init(value: .regular),
            italic: .init(value: false)
        )
        case .stack: return MakeableStack(content: .init(elements: []))
        }
    }
    
    var valueString: String { protoString }
    
    func value(with variables: Binding<Variables>) throws -> VariableValue? {
        self
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
        }.pickerStyle(.menu).any
    }
}
