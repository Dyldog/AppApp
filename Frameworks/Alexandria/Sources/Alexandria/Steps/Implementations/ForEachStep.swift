//
//  ForEachStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 9/12/2023.
//

import SwiftUI
import Armstrong

public final class ForEachStep: Step {
    
    public static let categories: [ValueCategory] = [.looping]
    public static var type: VariableType { .forEachStep }
    public static var title: String { "Loop over an array of values" }
    public var values: TypedValue<ArrayValue>
    public var loop: StepArray
    
    public var protoString: String { "FOR VALUE in $\(values.protoString):\n\t\(loop.protoString)" }
    public var valueString: String { "FOR VALUE in $\(values.valueString):\n\t\(loop.valueString)" }

    public init(values: TypedValue<ArrayValue>, loop: StepArray) {
        self.values = values
        self.loop = loop
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .values: return TypedValue.value(ArrayValue(type: .string, elements: []))
        case .loop: return StepArray(value: [])
        }
    }
    
    public func run(with variables: Variables, and scope: Scope) throws {
        for value in loop.value {
            let value = try value.value(with: variables, and: scope)
             variables.set(value, for: "$INPUT")
            try loop.run(with: variables, and: scope)
        }
    }
}

extension ForEachStep {
    public var codeRepresentation: String {
        "TODO"
    }
}


