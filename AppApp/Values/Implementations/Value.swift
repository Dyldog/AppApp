//
//  Value.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

// sourcery: variableTypeName = "value"
final class Value: EditableVariableValue {
    
    static var type: VariableType { .value }
    var value: any EditableVariableValue
    
    init(value: any EditableVariableValue) {
        self.value = value
    }
    
    static func makeDefault() -> Value {
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
    
    func editView(onUpdate: @escaping (Value) -> Void) -> AnyView {
        HStack {
            Text(value.protoString)
            SheetButton(title: { Text("Edit") }) {
                EditVariableView(value: value) { [weak self] in
                    guard let self = self else { return }
                    self.value = $0
                }
            } onDismiss: {
                onUpdate(self)
            }
        }.any
    }
}

extension Value: Codable {
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
