//
//  VariableStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

final class VariableStep: ValueStep {
    static var title: String { "Get variable" }
    var varName: AnyValue
    var type: VariableTypeValue
    
    var protoString: String { "{ $\(varName.protoString) }" }
    var valueString: String { "{ $\(varName.valueString) }" }
    
    init(varName: AnyValue, type: VariableTypeValue) {
        self.varName = varName
        self.type = type
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .varName: return AnyValue(value: StringValue(value: "$0"))
        case .type: return VariableTypeValue(value: .string)
        }
    }

    func run(with variables: Variables) async throws -> VariableValue {
        let nameValue = try await varName.value(with: variables)
        
        guard let value = await variables.value(for: nameValue.valueString)
        else { throw VariableValueError.valueNotFoundForVariable(varName.protoString) }
        
        return try await value.value(with: variables)
    }
}

extension VariableStep: CodeRepresentable {
    var codeRepresentation: String {
        varName.codeRepresentation
    }
}
