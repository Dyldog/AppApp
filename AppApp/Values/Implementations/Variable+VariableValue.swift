//
//  Variable+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

/// A value that provides a value from the variables
final class Variable: PrimitiveEditableVariableValue {
    static var type: VariableType { .variable }
    var value: any EditableVariableValue
    static var defaultValue: any EditableVariableValue { StringValue(value: "VAR") }
    
    init(value: any EditableVariableValue) {
        self.value = value
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
//        guard let name = name else { throw VariableValueError.valueNotFoundForVariable }
        return try value.add(other)
    }
    
    var protoString: String { "{ \(value.protoString) }" }
    var valueString: String { "\(value.valueString)" }
    
    func value(with variables: Variables) async throws -> VariableValue? {
        guard
            let nameValue = try await value.value(with: variables),
            let value = await variables.value(for: nameValue.valueString)
        else {
            throw VariableValueError.valueNotFoundForVariable(value.protoString)
        }
        return try await value.value(with: variables)
    }
    
    func editView(onUpdate: @escaping (Variable) -> Void) -> AnyView {
        HStack {
            Text("Name")
            Text(value.protoString)
            SheetButton(title: { Text("Edit") }) {
                EditVariableView(value: value) { [weak self] in
                    guard let self = self else { return }
                    self.value = $0
                    onUpdate(self)
                }
            }
        }.any
    }
}

extension Variable: Codable {
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(value: try container.decode(CodableVariableValue.self, forKey: .name).value)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableVariableValue(value: value), forKey: .name)
    }
}
