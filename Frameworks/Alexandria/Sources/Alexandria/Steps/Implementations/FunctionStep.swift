//
//  FunctionStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI
import Armstrong

public final class FunctionStep: Step {
    
    public static let categories: [ValueCategory] = [.variables]
    public static var type: VariableType { .functionStep }
    public static var title: String { "Run function" }
    public var functionName: AnyValue
    
    public var protoString: String { "\(functionName.protoString)()" }
    public var valueString: String { "\(functionName.valueString)()" }
    
    public init(functionName: AnyValue) {
        self.functionName = functionName
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .functionName: return AnyValue(value: StringValue(value: "MYFUNC"))
        }
    }

    public func run(with variables: Variables, and scope: Scope) throws {
        let nameValue = try functionName.value(with: variables, and: scope)
        
        guard let value =  variables.value(for: nameValue.valueString) as? StepArray
        else { throw VariableValueError.valueNotFoundForVariable(functionName.protoString) }
        
        try value.run(with: variables, and: scope)
    }
}


extension FunctionStep: CodeRepresentable {
    public var codeRepresentation: String {
        "\(functionName.codeRepresentation)()"
    }
}
