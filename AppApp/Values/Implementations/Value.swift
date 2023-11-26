//
//  Value.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class Value: VariableValue, CompositeEditableVariableValue {
    
    enum Properties: String, PrimitiveViewProperty {
        case value
        
        var defaultValue: Any {
            switch self {
            case .value: return StringValue(value: "TEXT")
            }
        }
    }
    
    static var type: VariableType { .value }
    var value: VariableValue
    
    init(value: VariableValue) {
        self.value = value
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        return try value.add(other)
    }
    
    var protoString: String { value.protoString }
    var valueString: String { value.valueString }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        try await value.value(with: variables)
    }
    
    func editView(title: String, onUpdate: @escaping (Value) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Text("Edit") }) {
                EditVariableView(value: self.value) {
                    onUpdate(.init(value: $0))
                }
            }
        }.any
    }
    
    static func make(factory: (Properties) -> Any) -> Value {
        .init(value: factory(.value) as! any VariableValue)
    }
    
    func value(for property: Properties) -> Any? {
        switch property {
        case .value: return value
        }
    }
    
    func set(_ value: Any, for property: Properties) {
        switch property {
        case .value: self.value = value as! any VariableValue
        }
    }
}

extension Value: Codable {
    enum CodingKeys: String, CodingKey {
        case value
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(value: try container.decode(CodableVariableValue.self, forKey: .value).value)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableVariableValue(value: value), forKey: .value)
    }
}
