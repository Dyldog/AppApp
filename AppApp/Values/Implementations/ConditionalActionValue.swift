//
//  ConditionalActionValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 27/11/2023.
//

import Foundation

final class ConditionalActionValue: CompositeEditableVariableValue, ObservableObject {
    
    static var type: VariableType { .conditionalAction }
    
    var ifCondition: Value
    var ifSteps: StepArray
    
    var protoString: String { "if { \(ifCondition.protoString) }:\n\t\(ifSteps.protoString)" }
    var valueString: String { "if { \(ifCondition.valueString) }:\n\t\(ifSteps.valueString)" }
    
    init(ifCondition: Value, ifSteps: StepArray) {
        self.ifCondition = ifCondition
        self.ifSteps = ifSteps
    }
    
    func add(_ other: VariableValue) throws -> VariableValue { fatalError() }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .ifCondition: return Value(value: BoolValue(value: true))
        case .ifSteps: return StepArray(value: [])
        }
    }
    
    func value(with variables: Variables) async throws -> VariableValue? {
        guard
            let conditionValue = try await ifCondition.value(with: variables) as? BoolValue
        else { throw VariableValueError.valueNotFoundForVariable(ifCondition.protoString) }

        if conditionValue.value {
            return ifSteps
        } else {
            return nil
        }
    }
}
