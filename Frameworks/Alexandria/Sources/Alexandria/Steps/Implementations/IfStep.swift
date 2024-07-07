//
//  IfStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 27/11/2023.
//

import Foundation
import Armstrong

public final class IfStep: Step {
    
    public static let categories: [ValueCategory] = [.logicSteps]
    public static var title: String { "If condition" }
    public static var type: VariableType { .ifStep }
    
    public var ifAction: ConditionalActionValue
    public var elseAction: StepArray
    
    public init(ifAction: ConditionalActionValue, elseAction: StepArray) {
        self.ifAction = ifAction
        self.elseAction = elseAction
    }
    
    public var protoString: String { """
    \(ifAction.protoString)\(!elseAction.value.isEmpty ? "\nelse:\n\t\(elseAction.protoString)" : "")
    """ }
    
    public var valueString: String { """
    \(ifAction.valueString)\(!elseAction.value.isEmpty ? "\nelse:\n\t\(elseAction.valueString)" : "")
    """ }
    
    public func run(with variables: Variables, and scope: Scope) throws {
        let ifValue: StepArray = try ifAction.value(with: variables, and: scope)
        if !ifValue.value.isEmpty {
            try ifValue.run(with: variables, and: scope)
        } else {
            try elseAction.run(with: variables, and: scope)
        }
    }

    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .ifAction: return ConditionalActionValue.makeDefault()
        case .elseAction: return StepArray.makeDefault()
        }
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}

extension IfStep {
    public var codeRepresentation: String {
        """
        \(ifAction.codeRepresentation) else {
            \(elseAction.codeRepresentation)
        }
        """
    }
}
