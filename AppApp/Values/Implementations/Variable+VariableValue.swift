//
//  Variable+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

/// A value that provides a value from the variables
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
