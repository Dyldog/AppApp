//
//  File.swift
//  AppApp
//
//  Created by Dylan Elliott on 30/11/2023.
//

import Foundation

protocol NumericValue: VariableValue {
    associatedtype NValue: Numeric
    var value: NValue { get }
    init(value: NValue)
}

extension NumericValue {
    func perform(operation: NumericalOperationType, with other: any NumericValue) throws -> Self {
        guard let other = other as? Self else {
            throw VariableValueError.wrongTypeForOperation
        }
        
        return .init(value: operation.func()(self.value, other.value))
    }
}

extension NumericType: PickableValue { }