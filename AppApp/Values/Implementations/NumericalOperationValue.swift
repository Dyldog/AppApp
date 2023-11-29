//
//  NumericalOperation.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import Foundation

final class NumericalOperationValue: CompositeEditableVariableValue {
    
    static var type: VariableType { .numericalOperation }
    
    var protoString: String { "\(lhs.protoString) \(operation.protoString) \(rhs.protoString)" }
    var valueString: String  { "\(lhs.valueString) \(operation.valueString) \(rhs.valueString)" }
    
    var lhs: AnyValue
    var rhs: AnyValue
    var operation: NumericalOperationTypeValue
    
    init(lhs: AnyValue, rhs: AnyValue, operation: NumericalOperationTypeValue) {
        self.lhs = lhs
        self.rhs = rhs
        self.operation = operation
    }
    
    static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .lhs: return AnyValue(value: StringValue(value: "A"))
        case .rhs: return AnyValue(value: StringValue(value: "B"))
        case .operation: return NumericalOperationTypeValue(value: .mod)
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.comparison, "add")
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        guard
            let lhs = try await lhs.value(with: variables) as? IntValue,
            let rhs = try await rhs.value(with: variables) as? IntValue
        else { throw VariableValueError.wrongTypeForOperation }
        
        return operation.operate(lhs: lhs, rhs: rhs)
    }
}

