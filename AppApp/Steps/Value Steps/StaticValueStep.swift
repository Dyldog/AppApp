//
//  StaticValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class StaticValueStep: ValueStep {
    static var title: String { "Static value" }
    var value: Value
    var type: VariableTypeValue
    
    var protoString: String { value.protoString }
    
    init(value: Value, type: VariableTypeValue) {
        self.value = value
        self.type = type
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .type: return VariableTypeValue(value: .string)
        case .value: return Variable(value: StringValue(value: "TEXT"))
        }
    }
    
    func run(with variables: Variables) async throws -> VariableValue {
        guard let typedValue = try await value.value(with: variables)
        else { throw VariableValueError.wrongTypeForOperation }
        return typedValue
    }
}
