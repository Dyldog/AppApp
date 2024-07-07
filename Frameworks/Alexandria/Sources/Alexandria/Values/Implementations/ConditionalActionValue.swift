//
//  ConditionalActionValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 27/11/2023.
//

import Foundation
import Armstrong

public final class ConditionalActionValue: CompositeEditableVariableValue, ObservableObject {
    public static let categories: [ValueCategory] = [.computation]
    public static var type: VariableType { .conditionalAction }
    
    public var ifCondition: ComparisonValue
    public var ifSteps: StepArray
    
    public var protoString: String { "if { \(ifCondition.protoString) }:\n\t\(ifSteps.protoString)" }
    public var valueString: String { "if { \(ifCondition.valueString) }:\n\t\(ifSteps.valueString)" }
    
    public init(ifCondition: ComparisonValue, ifSteps: StepArray) {
        self.ifCondition = ifCondition
        self.ifSteps = ifSteps
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue { fatalError() }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .ifCondition: return ComparisonValue(
            lhs: .init(value: Variable(value: StringValue(value: "VAR").any)),
            rhs: .init(value: BoolValue(value: true)),
            comparison: .init(value: .equals)
        )
        case .ifSteps: return StepArray(value: [])
        }
    }
    
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let conditionValue: BoolValue = try ifCondition.value(with: variables, and: scope)

        if conditionValue.value {
            return ifSteps
        } else {
            return StepArray(value: [])
        }
    }
}

extension ConditionalActionValue: CodeRepresentable {
    public var codeRepresentation: String {
        """
        if (\(ifCondition.codeRepresentation) {
            \(ifSteps.codeRepresentation)
        }
        """
    }
}
