//
//  Variable+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

/// A value that provides a value from the variables
final class Variable: EditableVariableValue {
    static var type: VariableType { .variable }
    var value: any EditableVariableValue
    
    init(value: any EditableVariableValue) {
        self.value = value
    }
    
    static func makeDefault() -> Variable {
        .init(value: StringValue(value: "VAR"))
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
//        guard let name = name else { throw VariableValueError.valueNotFoundForVariable }
        return try value.add(other)
    }
    
    var protoString: String { "$\(value.protoString)" }
    var valueString: String { "\(value.valueString)" }
    
    func value(with variables: Variables) async throws -> VariableValue {
        let nameValue = try await value.value(with: variables)
        guard let value = await variables.value(for: nameValue.valueString) else {
            throw VariableValueError.valueNotFoundForVariable(value.protoString)
        }
        return try await value.value(with: variables)
    }
    
    func editView(title: String, onUpdate: @escaping (Variable) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Image(systemName: "ellipsis.circle.fill") }) {
                EditVariableView(name: title, value: value) { [weak self] in
                    guard let self = self else { return }
                    self.value = $0
                }
            } onDismiss: {
                onUpdate(self)
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
