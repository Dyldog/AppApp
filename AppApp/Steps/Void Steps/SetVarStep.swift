//
//  SetVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class SetVarStep: Step {
    
    
    static var title: String { "Set variable" }
    static var type: VariableType { fatalError() }
    
    var varName: AnyValue
    var value: AnyValue
    
    init(varName: AnyValue, value: AnyValue) {
        self.varName = varName
        self.value = value
    }
    
    var protoString: String { "{ $\(varName.protoString) = \(value.protoString) }" }
    var valueString: String { "{ $\(varName.valueString) = \(value.valueString) }" }
    
    func run(with variables: Variables) async throws {
        let varValue = try await varName.value(with: variables)
        let valueValue = try await value.value(with: variables)
        await variables.set(valueValue, for: varValue.valueString)
    }

    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return AnyValue(value: StringValue(value: "TEXT"))
        case .varName: return AnyValue(value: StringValue(value: "VAR"))
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}
