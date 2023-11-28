//
//  NumericalOperationType.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import SwiftUI

enum NumericalOperationType: String, Codable, CaseIterable, Titleable {
    case add
    case subtract
    case mulitply
    case divide
    case power
    case mod
    
    var title: String {
        switch self {
        case .add: "plus"
        case .subtract: "minus"
        case .mulitply: "times"
        case .divide: "divided by"
        case .power: "to the power of"
        case .mod: "mod"
        }
    }
    
    var `func`: (Int, Int) -> Int {
        switch self {
        case .add: return { $0 + $1}
        case .subtract: return { $0 - $1}
        case .mulitply: return { $0 * $1}
        case .divide: return { $0 / $1}
        case .power: return { (pow(Decimal($0), $1) as NSDecimalNumber).intValue }
        case .mod: return { $0 % $1}
        }
    }
}

final class NumericalOperationTypeValue: PrimitiveEditableVariableValue {
    
    static var type: VariableType { .numericalOperationType }
    
    var value: NumericalOperationType
    
    var protoString: String { value.title }
    var valueString: String { protoString }
    
    init(value: NumericalOperationType) {
        self.value = value
    }
    
    static func makeDefault() -> NumericalOperationTypeValue {
        .init(value: .mod)
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.comparisonType, "add")
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    
    func operate(lhs: IntValue, rhs: IntValue) -> IntValue {
        return .init(value: value.func(lhs.value, rhs.value))
    }
}
