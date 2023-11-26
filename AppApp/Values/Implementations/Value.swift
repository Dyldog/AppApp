//
//  Value.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

// sourcery: variableTypeName = "value"
final class Value: PrimitiveEditableVariableValue {
    
    static var type: VariableType { .value }
    var value: any EditableVariableValue
    static var defaultValue: any EditableVariableValue { StringValue(value: "TEXT") }
    init(value: any EditableVariableValue) {
        self.value = value
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .value: return StringValue.defaultValue
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        return try value.add(other)
    }
    
    var protoString: String { value.protoString }
    var valueString: String { value.valueString }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        try await value.value(with: variables)
    }
    
    func editView(onUpdate: @escaping (Value) -> Void) -> AnyView {
        HStack {
            Text(value.protoString)
            SheetButton(title: { Text("Edit") }) {
                EditVariableView(value: self.value) {
                    onUpdate(.init(value: $0))
                }
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
