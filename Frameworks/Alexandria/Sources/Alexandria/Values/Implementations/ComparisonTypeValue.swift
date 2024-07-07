//
//  ConditionalValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 28/11/2023.
//

import SwiftUI
import Armstrong

public enum ComparisonType: String, Codable, CaseIterable, Titleable, CodeRepresentable {
    case equals
    case notEqual
    
    public var title: String {
        switch self {
        case .equals: "Equals"
        case .notEqual: "Not Equal"
        }
    }
    
    public var codeRepresentation: String {
        switch self {
        case .equals: "=="
        case .notEqual: "!="
        }
    }
}

public final class ComparisonTypeValue: PrimitiveEditableVariableValue {
    
    public static let categories: [ValueCategory] = [.logicHelpers]
    public static var type: VariableType { .comparisonType }
    
    public var value: ComparisonType
    
    public var protoString: String { value.title }
    public var valueString: String { protoString }
    
    public init(value: ComparisonType) {
        self.value = value
    }
    
    public static func makeDefault() -> ComparisonTypeValue {
        .init(value: .equals)
    }
    
    public func add(_ other: VariableValue) throws -> VariableValue {
        throw VariableValueError.variableCannotPerformOperation(.comparisonType, "add")
    }
    
    public func value(with variables: Variables, and scope: Scope) throws -> VariableValue {
        self
    }
    
    public func compare(lhs: any VariableValue, rhs: VariableValue) -> BoolValue {
        switch value {
        case .equals: return .init(value: lhs.valueString == rhs.valueString)
        case .notEqual: return .init(value: lhs.valueString != rhs.valueString)
        }
    }
}
