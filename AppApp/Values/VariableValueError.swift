//
//  VariableValueError.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

enum VariableValueError: LocalizedError, Identifiable {
    var id: String { localizedDescription }
    case wrongTypeForOperation
    case valueNotFoundForVariable(String)
    
    var localizedDescription: String {
        switch self {
        case .wrongTypeForOperation:
            return "Wrong type for operation"
        case let .valueNotFoundForVariable(variable):
            return "Value not found for variable '\(variable)'"
        }
    }
}
