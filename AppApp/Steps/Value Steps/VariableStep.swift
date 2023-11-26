//
//  VariableStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class VariableStep: ValueStep {
    static var title: String { "Get variable" }
    var varName: Value
    var type: VariableTypeValue
    
    var protoString: String { "{ $\(varName) }" }
    
    init(varName: Value, type: VariableTypeValue) {
        self.varName = varName
        self.type = type
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .varName: return Value(value: StringValue(value: "$0"))
        case .type: return VariableTypeValue(value: .string)
        }
    }

    func run(with variables: Binding<Variables>) async throws -> VariableValue {
        guard
            let nameValue = try await varName.value(with: variables),
            let value = variables.wrappedValue.value(for: nameValue.valueString)
        else { throw VariableValueError.valueNotFoundForVariable(varName.protoString) }
        
        guard let typedValue = try await value.value(with: variables)
        else { throw VariableValueError.wrongTypeForOperation }
        
        
        return typedValue
    }
}
