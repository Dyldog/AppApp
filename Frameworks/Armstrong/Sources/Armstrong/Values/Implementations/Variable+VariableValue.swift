//
//  Variable+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

// sourcery: skipCodable
/// A value that provides a value from the variables
public final class Variable: EditableVariableValue, ObservableObject {
    public static let categories: [ValueCategory] = [.computation]
    public static var type: VariableType { .variable }
    public var value: AnyValue { didSet { objectWillChange.send() } }

    public init(value: AnyValue) {
        self.value = value
    }

    public static func makeDefault() -> Variable {
        .init(value: StringValue(value: "VAR").any)
    }

    public func add(_ other: VariableValue) throws -> VariableValue {
//        guard let name = name else { throw VariableValueError.valueNotFoundForVariable }
        return try value.add(other)
    }

    public var protoString: String { "$\(value.protoString)" }
    public var valueString: String { "\(value.valueString)" }

    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let nameValue = try value.value(with: variables, and: scope)
        guard let value = variables.value(for: nameValue.valueString) else {
            throw VariableValueError.valueNotFoundForVariable(value.protoString)
        }
        return try value.value(with: variables, and: scope)
    }

    public func editView(scope: Scope, title: String, onUpdate: @escaping (Variable) -> Void) -> AnyView {
        value.editView(scope: scope, title: title) { [weak self] value in
            guard let self else { return }
            self.value = value
            onUpdate(self)
        }
        .any
    }
}

extension Variable: Codable {
    enum CodingKeys: String, CodingKey {
        case name
    }

    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        try self.init(value: container.decode(AnyValue.self, forKey: .name))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .name)
    }
}

extension Variable: CodeRepresentable {
    public var codeRepresentation: String {
        value.valueString
    }
}

public extension Variable {
    static func named(_ name: String) -> Variable {
        .init(value: StringValue(value: name).any)
    }
}

public extension AnyValue {
    static func variable(named name: String) -> AnyValue {
        Variable.named(name).any
    }
}
