//
//  ConditionalValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import SwiftUI
import Armstrong

enum ComparisonType: String, Codable, CaseIterable, Titleable, CodeRepresentable {
    case equals
    
    var title: String {
        switch self {
        case .equals: "Equals"
        }
    }
    
    var codeRepresentation: String {
        switch self {
        case .equals: "=="
        }
    }
}

final class ComparisonTypeValue: PrimitiveEditableVariableValue {
    
    static var type: VariableType { .comparisonType }
    
    var value: ComparisonType
    
    var protoString: String { value.title }
    var valueString: String { protoString }
    
    init(value: ComparisonType) {
        self.value = value
    }
    
    static func makeDefault() -> ComparisonTypeValue {
        .init(value: .equals)
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.comparisonType, "add")
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        self
    }
    
    func compare(lhs: any VariableValue, rhs: VariableValue) -> BoolValue {
        switch value {
        case .equals: return .init(value: lhs.valueString == rhs.valueString)
        }
    }
}
