//
//  Variable+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

/// A value that provides a value from the variables
struct Variable: VariableValue {
    static var type: VariableType { .variable }
    var name: VariableValue
    
    func add(_ other: VariableValue) throws -> VariableValue {
//        guard let name = name else { throw VariableValueError.valueNotFoundForVariable }
        return try name.add(other)
    }
    
    var protoString: String { "{ \(name.protoString) }" }
    var valueString: String { "\(name.valueString)" }
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        guard
            let nameValue = try await name.value(with: variables),
            let value = variables.wrappedValue.value(for: nameValue.valueString)
        else {
            throw VariableValueError.valueNotFoundForVariable(name.protoString)
        }
        return try await value.value(with: variables)
    }
    
    func editView(title: String, onUpdate: @escaping (Variable) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Text("Edit") }) {
                EditVariableView(value: name) {
                    onUpdate(.init(name: $0))
                }
            }
        }.any
    }
}

extension Variable: Codable {
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(CodableVariableValue.self, forKey: .name).value
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableVariableValue(value: name), forKey: .name)
    }
}
