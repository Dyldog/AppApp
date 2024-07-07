//
//  AddToVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class AddToVarStep: Step, ObservableObject {
    
    public static let categories: [ValueCategory] = [.numbers, .variables]
    public static var type: VariableType { .addToVarStep }
    public static var title: String { "Add to variable" }
    public var varName: AnyValue
    public var value: AnyValue
    
    public var protoString: String { "{ $\(varName.protoString) += \(value.protoString) }" }
    public var valueString: String { "{ $\(varName.valueString) += \(value.valueString) }" }
    
    public init(varName: AnyValue, value: AnyValue) {
        self.varName = varName
        self.value = value
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return IntValue(value: 1).any
        case .varName: return StringValue(value: "VAR").any
        }
    }
    
    public func run(with variables: Variables, and scope: Scope) throws {
        let varNameValue = try varName.value(with: variables, and: scope)
        
        guard let oldValue = variables.value(for: varNameValue.valueString) else {
            throw VariableValueError.valueNotFoundForVariable(varNameValue.valueString)
        }
        let extraValue = try value.value(with: variables, and: scope)
         variables.set(try oldValue.add(extraValue), for: varName.valueString)
    }
    
    public enum Error: StepError, Swift.Error {
        case cantAddToUnsetVariable
    }
}

extension AddToVarStep: CodeRepresentable {
    public var codeRepresentation: String {
        "\(varName.valueString) = \(varName.codeRepresentation) + \(value.codeRepresentation)"
    }
}
