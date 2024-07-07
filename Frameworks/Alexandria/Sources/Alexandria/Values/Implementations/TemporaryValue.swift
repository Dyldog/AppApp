//
//  TemporaryValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI
import Armstrong

// sourcery: skipCodable
public final class TemporaryValue: CompositeEditableVariableValue {
    public static let categories: [ValueCategory] = [.helperValues]
    public static var type: VariableType { .temporary }
    
    public var initial: AnyValue
    public var output: Variable
    
    public init(initial: AnyValue, output: Variable) {
        self.initial = initial
        self.output = output
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .initial: return AnyValue(value: StringValue(value: "TEXT"))
        case .output: return Variable(value: StringValue(value: "FIELDTEXT").any)
        }
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        return try output.add(other)
    }
    
    public var protoString: String { "\(output.protoString) = \(initial.protoString)" }
    
    public var valueString: String { output.valueString }
    
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let variableName = try output.value.value(with: variables, and: scope)
        if let setValue =  variables.value(for: variableName.valueString) {
            return setValue
        } else {
            return try initial.value(with: variables, and: scope)
        }
    }
    
    public func editView(scope: Scope, title: String, onUpdate: @escaping (TemporaryValue) -> Void) -> AnyView {
        VStack {
            HStack {
                Text("Initial")
                initial.editView(scope: scope, title: "\(title)[initial]", onUpdate: { [weak self] in
                    guard let self = self else { return }
                    self.initial = $0
                    onUpdate(self)
                })
            }
            
            HStack {
                Text("Output")
                output.editView(scope: scope, title: "\(title)[output]") {
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
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            initial: try container.decode(AnyValue.self, forKey: .initial),
            output: try container.decode(Variable.self, forKey: .output)
        )
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(initial, forKey: .initial)
        try container.encode(output, forKey: .output)
    }
}

extension TemporaryValue: CodeRepresentable {
    public var codeRepresentation: String {
        "\(output.codeRepresentation) ?? \(initial.codeRepresentation)"
    }
}
