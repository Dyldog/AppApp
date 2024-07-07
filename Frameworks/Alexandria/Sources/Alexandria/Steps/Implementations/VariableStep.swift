//
//  VariableStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class VariableStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.variables]
    public static var type: VariableType { .variableStep }
    public static var title: String { "Get variable" }
    public var varName: AnyValue
    public var type: VariableTypeValue
    
    public var protoString: String { "{ $\(varName.protoString) }" }
    public var valueString: String { "{ $\(varName.valueString) }" }
    
    public init(varName: AnyValue, type: VariableTypeValue) {
        self.varName = varName
        self.type = type
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .varName: return AnyValue(value: StringValue(value: "$0"))
        case .type: return VariableTypeValue(value: .string)
        }
    }

    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let nameValue = try varName.value(with: variables, and: scope)
        
        guard let value =  variables.value(for: nameValue.valueString)
        else { throw VariableValueError.valueNotFoundForVariable(varName.protoString) }
        
        return try value.value(with: variables, and: scope)
    }
}

extension VariableStep: CodeRepresentable {
    public var codeRepresentation: String {
        varName.codeRepresentation
    }
}
