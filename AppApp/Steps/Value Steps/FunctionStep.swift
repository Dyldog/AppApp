//
//  FunctionStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

final class FunctionStep: Step {
    static var title: String { "Run function" }
    var functionName: AnyValue
    
    var protoString: String { "\(functionName.protoString)()" }
    var valueString: String { "\(functionName.valueString)()" }
    
    init(functionName: AnyValue) {
        self.functionName = functionName
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .functionName: return AnyValue(value: StringValue(value: "MYFUNC"))
        }
    }

    func run(with variables: Variables) async throws {
        let nameValue = try await functionName.value(with: variables)
        
        guard let value = await variables.value(for: nameValue.valueString) as? StepArray
        else { throw VariableValueError.valueNotFoundForVariable(functionName.protoString) }
        
        try await value.run(with: variables)
    }
}

