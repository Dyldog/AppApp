//
//  Value.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

// sourcery: variableTypeName = "anyValue"
final class AnyValue: EditableVariableValue {
    
    static var type: VariableType { .anyValue }
    var value: any EditableVariableValue
    
    init(value: any EditableVariableValue) {
        if let value = value as? AnyValue {
            self.value = value.value
        } else {
            self.value = value
        }
    }
    
    static func makeDefault() -> AnyValue {
        .init(value: StringValue(value: "TEXT"))
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        return try value.add(other)
    }
    
    var protoString: String { value.protoString }
    var valueString: String { value.valueString }
    
    func value(with variables: Variables) async throws -> VariableValue {
        try await value.value(with: variables)
    }
    
    func editView(title: String, onUpdate: @escaping (AnyValue) -> Void) -> AnyView {
        HStack {
            Text(value.protoString)
            SheetButton(title: { Image(systemName: "ellipsis.circle.fill") }) {
                EditVariableView(name: title, value: value) { [weak self] in
                    guard let self = self else { return }
                    self.value = $0
                    onUpdate(self)
                }
            } onDismiss: {
//                onUpdate(self)
            }
        }.any
    }
}

extension AnyValue: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case value
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            value: try container.decode(CodableVariableValue.self, forKey: .value).value
        )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableVariableValue(value: value), forKey: .value)
    }
}

extension EditableVariableValue {
    var any: AnyValue {
        .init(value: self)
    }
}

extension AnyValue: CodeRepresentable {
    var codeRepresentation: String { value.codeRepresentation }
}
