//
//  Array_StepType+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

extension Array: VariableValue where Element == any StepType {
    static var type: VariableType { .action }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? Array<any Step> else { throw VariableValueError.wrongTypeForOperation }
        return self + other
    }
    
    var protoString: String {
        map { $0.protoString }
        .joined(separator: "\n")
    }
    
    var valueString: String {
        map { $0.protoString }
        .joined(separator: "\n")
    }
    
    func value(with variables: inout Variables) throws -> VariableValue? {
        var variables = try reduce(into: variables, { variables, step in
            try step.run(with: &variables)
        })
        return try variables.value(for: "$0")!.value(with: &variables)
    }
    
    func editView(title: String, onUpdate: @escaping (Array<any StepType>) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: {
                Text(title)
            }) {
                ActionListView(steps: self, onUpdate: onUpdate)
            }
        }.any
    }
}
