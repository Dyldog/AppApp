//
//  NumericValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 30/11/2023.
//

import Foundation

public protocol NumericValue: EditableVariableValue, Codable {
    associatedtype NValue: Numeric
    var value: NValue { get }
    init(value: NValue)
}

public extension NumericValue {
    func perform(operation: NumericalOperationType, with other: any NumericValue) throws -> Self {
        guard let other = other as? Self else {
            throw VariableValueError.wrongTypeForOperation
        }

        return .init(value: operation.func()(value, other.value))
    }
}

// sourcery: categories = ".numbers"
extension NumericType: PickableValue {}
