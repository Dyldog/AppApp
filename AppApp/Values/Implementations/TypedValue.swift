//
//  TypedValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

enum TypedValueOptionType: Int, CaseIterable, Hashable {
    case variable
    case constant
    
    func makeDefault<T: EditableVariableValue>() -> TypedValueOption<T> {
        switch self {
        case .variable: return .variable(.makeDefault())
        case .constant: return .constant(T.makeDefault())
        }
    }
    
    var title: String {
        switch self {
        case .variable: return "VAR"
        case .constant: return "CONSTANT"
        }
    }
}

enum TypedValueOption<T: TypeableValue>: Codable {
    case variable(Variable)
    case constant(T)
    
    var title: String {
        type.title
    }
    
    var variable: Variable? {
        switch self {
        case .variable(let variable): return variable
        case .constant: return nil
        }
    }
    
    var constant: T? {
        switch self {
        case .variable: return nil
        case .constant(let constant): return constant
        }
    }
    
    var value: any EditableVariableValue {
        switch self {
        case .variable(let variable): return variable
        case .constant(let constant): return constant
        }
    }
    
    func value(with variables: Variables) async throws -> T {
        return try await value.value(with: variables)
    }
    
    var type: TypedValueOptionType {
        switch self {
        case .variable: return .variable
        case .constant: return .constant
        }
    }
}

// sourcery: skipCopying, skipVariableType, skipCodable
typealias TypeableValue = EditableVariableValue & Codable


// sourcery: variableTypeName = "typedValue", skipVariableType, skipCodable
final class TypedValue<T: TypeableValue>: EditableVariableValue, Codable {
    
    static var type: VariableType { fatalError() }
    
    var type: VariableType { T.type }
    
    var value: TypedValueOption<T>
    
    init(value: TypedValueOption<T>) {
        self.value = value
    }
    
    static func makeDefault() -> TypedValue<T> {
        .init(value: .constant(T.makeDefault()))
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        return try value.value.add(other)
    }
    
    var protoString: String { "\(value.title): \(value.value.protoString)" }
    var valueString: String { "\(value.title): \(value.value.valueString)" }
    
    func value(with variables: Variables) async throws -> VariableValue {
        try await value.value.value(with: variables)
    }

    func editView(title: String, onUpdate: @escaping (TypedValue<T>) -> Void) -> AnyView {
        HStack {
            Picker("", selection: .init(get: { [weak self] in
                self?.value.type ?? .constant
            }, set: { [weak self] (new: TypedValueOptionType) in
                guard let self = self else { return }
                self.value = new.makeDefault()
                onUpdate(self)
            })) {
                ForEach(TypedValueOptionType.allCases) {
                    Text($0.title).tag($0)
                }
            }.pickerStyle(.menu).any
            
            value.value.editView(title: title) {
                switch self.value.type {
                case .constant:
                    guard let constantValue = $0 as? T else { return }
                    self.value = .constant(constantValue)
                case .variable:
                    guard let variableValue = $0 as? Variable else { return }
                    self.value = .variable(variableValue)
                }
                onUpdate(self)
            }
        }.any
//        HStack {
//            Text(value.protoString)
//            SheetButton(title: { Text("Edit") }) {
//                EditVariableView(value: value) { [weak self] in
//                    guard let self = self else { return }
//                    self.value = $0
//                }
//            } onDismiss: {
//                onUpdate(self)
//            }
//        }.any
    }
}

extension TypedValue: CodeRepresentable {
    var codeRepresentation: String {
        value.value.codeRepresentation
    }
}
