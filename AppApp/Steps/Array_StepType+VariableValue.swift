//
//  Array_StepType+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

extension Array: VariableValue where Element == any StepType {
    static var type: VariableType { fatalError() }
    
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
    
    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
        for step in self {
            try await step.run(with: variables)
        }
        return try await variables.wrappedValue.value(for: "$0")!.value(with: variables)
    }
    
    func editView(title: String, onUpdate: @escaping (Array<any StepType>) -> Void) -> AnyView {
        HStack {
            Text(protoString)
                .fixedSize()
            SheetButton(title: {
                Text(title)
            }) {
                ActionListView(steps: self, onUpdate: onUpdate)
            }
        }.any
    }
}
