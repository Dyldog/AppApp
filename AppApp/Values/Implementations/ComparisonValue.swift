//
//  ComparisonValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import Foundation

final class ComparisonValue: CompositeEditableVariableValue {
    
    static var type: VariableType { .comparison }
    
    var protoString: String { "\(lhs.protoString) \(comparison.protoString) \(rhs.protoString)" }
    var valueString: String  { "\(lhs.valueString) \(comparison.valueString) \(rhs.valueString)" }
    
    var lhs: Value
    var rhs: Value
    var comparison: ComparisonTypeValue
    
    init(lhs: Value, rhs: Value, comparison: ComparisonTypeValue) {
        self.lhs = lhs
        self.rhs = rhs
        self.comparison = comparison
    }
    
    static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .lhs: return Value(value: StringValue(value: "A"))
        case .rhs: return Value(value: StringValue(value: "B"))
        case .comparison: return ComparisonTypeValue(value: .equals)
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.comparison, "add")
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        comparison.compare(
            lhs: try await lhs.value(with: variables),
            rhs: try await rhs.value(with: variables)
        )
    }
}
