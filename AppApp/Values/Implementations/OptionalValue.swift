//
//  OptionalValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import SwiftUI

final class OptionalValue: EditableVariableValue {
    
    static var type: VariableType { .optional }
    
    var protoString: String { "\(value.protoString)?" }
    var valueString: String { "\(value.valueString)?"}
    
    var value: AnyValue
    
    init(value: AnyValue) {
        self.value = value
    }
    
    static func makeDefault() -> OptionalValue {
        .init(value: AnyValue(value: NilValue()))
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        try value.add(other)
    }
    
    func editView(title: String, onUpdate: @escaping (OptionalValue) -> Void) -> AnyView {
        value.editView(title: title) {
            self.value = $0
            onUpdate(self)
        }
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        if let value = try? await value.value(with: variables) {
            return value
        } else {
            return NilValue()
        }
    }
}

extension OptionalValue: CodeRepresentable {
    var codeRepresentation: String {
        "\(value.codeRepresentation)?"
    }
}
