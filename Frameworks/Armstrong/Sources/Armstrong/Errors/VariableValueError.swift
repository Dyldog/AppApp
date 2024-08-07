//
//  VariableValueError.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

public enum VariableValueError: LocalizedError, Identifiable, Equatable {
    public var id: String { localizedDescription }
    case wrongTypeForOperation
    case valueNotFoundForVariable(String)
    case variableCannotPerformOperation(VariableType, String)
    case screenDoesNotExist(String)
    case emptyCollectionFound

    var localizedDescription: String {
        switch self {
        case .wrongTypeForOperation:
            return "Wrong type for operation"
        case let .valueNotFoundForVariable(variable):
            return "Value not found for variable '\(variable)'"
        case let .variableCannotPerformOperation(variable, operation):
            return "Variable \(variable) cannot perform step \(operation)"
        case let .screenDoesNotExist(screen):
            return "Screen '\(screen)' does not exist"
        case .emptyCollectionFound:
            return "Step requiring collection value encountered empty collection"
        }
    }
}
