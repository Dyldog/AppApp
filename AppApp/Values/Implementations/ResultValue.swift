//
//  StepValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

final class ResultValue: EditableVariableValue {
    
    static var type: VariableType { .result }
    
    var steps: StepArray
    
    var protoString: String { "\(steps.protoString)[$0]" }
    var valueString: String { "\(steps.valueString)[$0]" }
    
    init(steps: StepArray) {
        self.steps = steps
    }
    
    static func makeDefault() -> ResultValue {
        .init(steps: .init(value: []))
    }
    
    func editView(title: String, onUpdate: @escaping (ResultValue) -> Void) -> AnyView {
        steps.editView(title: title) { [weak self] in
            guard let self = self else { return }
            self.steps = $0
            onUpdate(self)
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.nil, "add")
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        for step in steps {
            try await step.run(with: variables)
        }
        
        return await variables.value(for: "$0") ?? NilValue()
    }
}

extension ResultValue: CodeRepresentable {
    var codeRepresentation: String {
        steps.codeRepresentation
    }
}
