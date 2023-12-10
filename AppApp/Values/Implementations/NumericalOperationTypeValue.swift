//
//  NumericalOperationType.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import SwiftUI
import Armstrong

enum NumericalOperationType: String, Codable, CaseIterable, Titleable, CodeRepresentable {
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
    
    func `func`<T: Numeric>() -> (T, T) -> T {
        switch self {
        case .add: return { $0 + $1}
        case .subtract: return { $0 - $1}
        case .mulitply: return { $0 * $1}
        case .divide: return { $0 / $1}
        case .power: return { $0 ** $1 }
        case .mod: return { $0 % $1}
        }
    }
    
    var codeRepresentation: String {
        switch self {
        case .add: return "+"
        case .subtract: return "-"
        case .mulitply: return "*"
        case .divide: return "/"
        case .power: return "**"
        case .mod: return "%"
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
    
    func operate<T: NumericValue>(lhs: T, rhs: T) -> T {
        return .init(value: value.func()(lhs.value, rhs.value))
    }
}
