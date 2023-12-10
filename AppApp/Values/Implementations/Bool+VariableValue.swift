//
//  Bool+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI
import Armstrong

// sourcery: variableTypeName = "boolean"
final class BoolValue: EditableVariableValue, Codable {
    
    static var type: VariableType { .boolean }
    
    var value: Bool
    
    init(value: Bool) {
        self.value = value
    }
    
    static var `true`: BoolValue {
        .init(value: true)
    }
    
    static var `false`: BoolValue {
        .init(value: false)
    }
    
    static func makeDefault() -> BoolValue {
        .init(value: false)
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.boolean, "add")
    }
    
    var protoString: String { valueString }
    
    var valueString: String { self.value ? "true" : "false" }
    
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    
    func editView(title: String, onUpdate: @escaping (BoolValue) -> Void) -> AnyView {
        Toggle("", isOn: .init(get: { [weak self] in
            self?.value ?? false
        }, set: { [weak self] in
            guard let self = self else { return }
            self.value = $0
            onUpdate(self)
        })).any
    }
}

extension BoolValue: CodeRepresentable {
    var codeRepresentation: String {
        switch value {
        case true: "true"
        case false: "false"
        }
    }
}
