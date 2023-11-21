//
//  String+VariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class ActionValue: VariableValue, ObservableObject {
    
    static var type: VariableType { .action}
    
    @Published var steps: [any StepType]
    var protoString: String { steps.protoString }
    
    init(steps: [any StepType]) {
        self.steps = steps
    }
    
    func string(with variables: inout Variables) throws -> String {
        try steps.string(with: &variables)
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError("TODO")
    }
    
    func editView(title: String, onUpdate: @escaping (ActionValue) -> Void) -> AnyView {
        return SheetButton(title: { Text(title) }) {
            ActionListView(steps: self.steps) {
                self.steps = $0
                onUpdate(self)
            }
        }.any
    }
}

extension String: VariableValue {
    static var type: VariableType { .string }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        guard let other = other as? String else { throw VariableValueError.wrongTypeForOperation }
        return self + other
    }
    
    var protoString: String { self }
    func string(with variables: inout Variables) -> String { protoString }
    
    func editView(title: String, onUpdate: @escaping (Self) -> Void) -> AnyView {
        TextField("", text: .init(get: {
            self
        }, set: {
            onUpdate($0)
        })).any
    }
}
