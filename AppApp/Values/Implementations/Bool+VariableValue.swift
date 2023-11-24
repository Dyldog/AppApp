//
//  Bool+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

extension Bool: VariableValue {
    
    static var type: VariableType { .boolean }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.boolean, "add")
    }
    
    var protoString: String { "BOOL" }
    
    var valueString: String { self ? "true" : "false" }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        self
    }
    
    func editView(title: String, onUpdate: @escaping (Bool) -> Void) -> AnyView {
        Toggle(title, isOn: .init(get: {
            self
        }, set: {
            onUpdate($0)
        })).any
    }
}
