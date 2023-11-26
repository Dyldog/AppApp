//
//  Bool+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

// sourcery: variableTypeName = "boolean"
final class BoolValue: PrimitiveEditableVariableValue, Codable {
    
    static var type: VariableType { .boolean }
    
    var value: Bool
    static let defaultValue: Bool = false
    
    init(value: Bool) {
        self.value = value
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.boolean, "add")
    }
    
    var protoString: String { "BOOL" }
    
    var valueString: String { self.value ? "true" : "false" }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
    
    func editView(onUpdate: @escaping (BoolValue) -> Void) -> AnyView {
        Toggle("", isOn: .init(get: {
            self.value
        }, set: {
            onUpdate(.init(value: $0))
        })).any
    }
}
