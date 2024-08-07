//
//  Bool+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

// sourcery: variableTypeName = "boolean"
public final class BoolValue: EditableVariableValue, Codable {
    public static let categories: [ValueCategory] = [.logic]
    public static var type: VariableType { .boolean }

    public var value: Bool

    public init(value: Bool) {
        self.value = value
    }

    public static var `true`: BoolValue {
        .init(value: true)
    }

    public static var `false`: BoolValue {
        .init(value: false)
    }

    public static func makeDefault() -> BoolValue {
        .init(value: false)
    }

    public func add(_: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.boolean, "add")
    }

    public var protoString: String { valueString }

    public var valueString: String { value ? "true" : "false" }

    public func value(with _: Variables, and _: Scope) throws -> VariableValue {
        self
    }

    public func editView(scope: Scope, title: String, onUpdate: @escaping (BoolValue) -> Void) -> AnyView {
        HStack {
            Text(title).bold().scope(scope)
            Spacer()
            Toggle("", isOn: .init(get: { [weak self] in
                self?.value ?? false
            }, set: { [weak self] in
                guard let self = self else { return }
                self.value = $0
                onUpdate(self)
            }))
            .scope(scope)
        }
        .tint(scope.color)
        .any
    }
}

extension BoolValue: CodeRepresentable {
    public var codeRepresentation: String {
        switch value {
        case true: "true"
        case false: "false"
        }
    }
}
