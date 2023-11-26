//
//  VariableType.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class VariableTypeValue: PrimitiveEditableVariableValue {
    
    static var type: VariableType { .type }
    static var defaultValue: VariableType { .string }
    var value: VariableType
    
    var protoString: String { value.protoString }
    
    var valueString: String { value.valueString }
    
    init(value: VariableType) {
        self.value = value
    }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    func editView(onUpdate: @escaping (VariableTypeValue) -> Void) -> AnyView {
        value.editView {
            onUpdate(.init(value: $0))
        }
    }
    
}
enum VariableType: String, CaseIterable, Equatable, Codable {
    
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
    case button
    
    var protoString: String { rawValue.capitalized }
    
    var defaultView: any EditableVariableValue {
        switch self {
        case .type: return VariableTypeValue.makeDefault()
        case .string: return StringValue.makeDefault()
        case .int: return IntValue.makeDefault()
        case .variable: return Variable.makeDefault()
//        case .action: return ActionValue(steps: [])
        case .value: return Value.makeDefault()
        case .list:  return ArrayValue.makeDefault()
//        case .dictionary: return DictionaryValue(type: .string, elements: [:])
//        case .temporary: return TemporaryValue(initial: StringValue(value: "TEXT"), output: .init(name: StringValue(value: "FIELDTEXT")))
        case .fontWeight: return FontWeightValue.makeDefault()
        case .boolean: return BoolValue.makeDefault()
        case .label: return MakeableLabel.makeDefault()
        case .stack: return MakeableStack.makeDefault()
        case .button: return MakeableButton.makeDefault()
        }
    }

    var valueString: String { protoString }
    
    func editView(onUpdate: @escaping (VariableType) -> Void) -> AnyView {
        Picker("", selection: .init(get: {
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
