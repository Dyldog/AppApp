//
//  VariableType.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

// sourcery: variableTypeName = "type"
final class VariableTypeValue: PrimitiveEditableVariableValue {
    
    static var type: VariableType { .type }
    static var defaultValue: VariableType { .string }
    var value: VariableType
    
    var protoString: String { value.protoString }
    
    var valueString: String { value.valueString }
    
    init(value: VariableType) {
        self.value = value
    }
    
    func value(with variables: Variables) async throws -> VariableValue? {
        self
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    func editView(onUpdate: @escaping (VariableTypeValue) -> Void) -> AnyView {
        value.editView { [weak self] in
            guard let self = self else { return }
            self.value = $0
            onUpdate(self)
        }
    }
    
}
extension VariableType {
    var protoString: String { rawValue.capitalized }

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
