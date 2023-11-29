//
//  TemporaryValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

final class TemporaryValue: CompositeEditableVariableValue {
    static var type: VariableType { .temporary }
    
    var initial: AnyValue
    var output: Variable
    
    init(initial: AnyValue, output: Variable) {
        self.initial = initial
        self.output = output
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .initial: return AnyValue(value: StringValue(value: "TEXT"))
        case .output: return Variable(value: StringValue(value: "FIELDTEXT"))
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        return try output.add(other)
    }
    
    var protoString: String { "\(output.protoString) = \(initial.protoString)" }
    
    var valueString: String { output.valueString }
    
    func value(with variables: Variables) async throws -> VariableValue {
        let variableName = try await output.value.value(with: variables)
        if let setValue = await variables.value(for: variableName.valueString) {
            return setValue
        } else {
            return try await initial.value(with: variables)
        }
    }
    
    func editView(title: String, onUpdate: @escaping (TemporaryValue) -> Void) -> AnyView {
        VStack {
            HStack {
                Text("Initial")
                initial.editView(title: "\(title)[initial]", onUpdate: { [weak self] in
                    guard let self = self else { return }
                    self.initial = $0
                    onUpdate(self)
                })
            }
            
            HStack {
                Text("Output")
                output.editView(title: "\(title)[output]") {
                    self.output = $0
                    onUpdate(self)
                }
            }
        }.any
    }
}

extension TemporaryValue: Codable {
    enum CodingKeys: String, CodingKey {
        case initial
        case output
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            initial: try container.decode(AnyValue.self, forKey: .initial),
            output: try container.decode(Variable.self, forKey: .output)
        )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(initial, forKey: .initial)
        try container.encode(output, forKey: .output)
    }
}
