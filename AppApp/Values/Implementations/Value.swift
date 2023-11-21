//
//  Value.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct Value: VariableValue, ExpressibleByStringLiteral {
    
    static var type: VariableType { .value }
    var value: VariableValue
    
    init(value: VariableValue) {
        self.value = value
    }
    
    init(stringLiteral value: String) {
        self.init(value: StringValue(value: value))
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        return try value.add(other)
    }
    
    var protoString: String { value.protoString }
    var valueString: String { value.valueString }
    
    func value(with variables: inout Variables) throws -> VariableValue? {
        try value.value(with: &variables)
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
