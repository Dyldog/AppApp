//
//  IfStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 27/11/2023.
//

import Foundation

final class IfStep: Step {
    
    
    static var title: String { "If condition" }
    static var type: VariableType { fatalError() }
    
    var ifAction: ConditionalActionValue
    var elseAction: StepArray
    
    init(ifAction: ConditionalActionValue, elseAction: StepArray) {
        self.ifAction = ifAction
        self.elseAction = elseAction
    }
    
    var protoString: String { """
    \(ifAction.protoString)
    else:\n\t\(elseAction.protoString)
    """ }
    
    func run(with variables: Variables) async throws {
        if let ifValue = try await ifAction.value(with: variables) as? StepArray, !ifValue.value.isEmpty {
            try await ifValue.run(with: variables)
        } else {
            try await elseAction.run(with: variables)
        }
    }

    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .ifAction: return ConditionalActionValue.makeDefault()
        case .elseAction: return StepArray.makeDefault()
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}
