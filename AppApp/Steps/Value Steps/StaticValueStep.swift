//
//  StaticValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class StaticValueStep: ValueStep {
    static var title: String { "Static value" }
    var value: AnyValue
    
    var protoString: String { value.protoString }
    var valueString: String { value.valueString }
    
    init(value: AnyValue) {
        self.value = value
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return Variable(value: StringValue(value: "TEXT"))
        }
    }
    
    func run(with variables: Variables) async throws -> VariableValue {
        return try await value.value(with: variables)
    }
}

extension StaticValueStep {
    var codeRepresentation: String {
        value.valueString
    }
}
