//
//  VariableType.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

// sourcery: variableTypeName = "type"
final class VariableTypeValue: PrimitiveEditableVariableValue {
    
    static var type: VariableType { .type }
    var value: VariableType
    
    var protoString: String { value.protoString }
    
    var valueString: String { value.valueString }
    
    init(value: VariableType) {
        self.value = value
    }
    
    static func makeDefault() -> VariableTypeValue {
        .init(value: .string)
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
    
    func editView(title: String, onUpdate: @escaping (VariableTypeValue) -> Void) -> AnyView {
        value.editView(title: title) { [weak self] in
            guard let self = self else { return }
            self.value = $0
            onUpdate(self)
        }
    }
    
}
extension VariableType {
    var protoString: String { title }

    var valueString: String { protoString }
    
    func editView(title: String, onUpdate: @escaping (VariableType) -> Void) -> AnyView {
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
