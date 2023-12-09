//
//  ColorValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

final class ColorValue: EditableVariableValue {
    
    static var type: VariableType { .color }
    
    var value: Color
    
    var protoString: String { "\(value)" }
    var valueString: String { protoString }
    
    init(value: Color) {
        self.value = value
    }
    
    static func makeDefault() -> ColorValue {
        .init(value: .blue)
    }
    
    func editView(title: String, onUpdate: @escaping (ColorValue) -> Void) -> AnyView {
        ColorPicker("Set the background color", selection: .init(get: { [weak self] in
            self?.value ?? .blue
        }, set: { [weak self] in
            guard let self = self else { return }
            self.value = $0
            onUpdate(self)
        })).labelsHidden().any
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.nil, "add")
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
}

extension ColorValue: CodeRepresentable {
    var codeRepresentation: String {
        "Color(hex: \"\(value.toHex!)\")"
    }
}

