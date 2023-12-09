//
//  ForEachStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 9/12/2023.
//

import SwiftUI

final class ForEachStep: Step {
    static var title: String { "Loop over an array of values" }
    
    var values: TypedValue<ArrayValue>
    var loop: StepArray
    
    var protoString: String { "FOR VALUE in $\(values.protoString):\n\t\(loop.protoString)" }
    var valueString: String { "FOR VALUE in $\(values.valueString):\n\t\(loop.valueString)" }

    init(values: TypedValue<ArrayValue>, loop: StepArray) {
        self.values = values
        self.loop = loop
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .values: return TypedValue.value(ArrayValue(type: .string, elements: []))
        case .loop: return StepArray(value: [])
        }
    }
    
    func run(with variables: Variables) async throws {
        for value in loop.value {
            let value = try await value.value(with: variables)
            await variables.set(value, for: "$INPUT")
            try await loop.run(with: variables)
        }
    }
}

extension ForEachStep {
    var codeRepresentation: String {
        "TODO"
    }
}


