//
//  SetVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

public final class SetVarStep: Step {
    public static let categories: [ValueCategory] = [.variables]
    public static var title: String { "Set variable" }
    public static var type: VariableType { .setVarStep }

    var varName: AnyValue
    var value: AnyValue

    public init(varName: AnyValue, value: AnyValue) {
        self.varName = varName
        self.value = value
    }

    public var protoString: String { "{ $\(varName.protoString) = \(value.protoString) }" }
    public var valueString: String { "{ $\(varName.valueString) = \(value.valueString) }" }

    public func run(with variables: Variables, and scope: Scope) throws {
        let varValue = try varName.value.value(with: variables, and: scope)
        let valueValue = try value.value(with: variables, and: scope)

        variables.set(valueValue, for: varValue.valueString)
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return AnyValue(value: StringValue(value: "TEXT"))
        case .varName: return AnyValue(value: StringValue(value: "VAR"))
        }
    }

    public func add(_: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension SetVarStep: CodeRepresentable {
    public var codeRepresentation: String {
        "\(varName.valueString) = \(value.codeRepresentation)"
    }
}
