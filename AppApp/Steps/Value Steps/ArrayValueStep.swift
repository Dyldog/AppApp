//
//  ArrayValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI

final class ArrayValueStep: ValueStep, Codable {
    
    static var title: String { "Get value from array" }
    var protoString: String { "\(array.protoString)[\(index.protoString)]"}
        
    var array: Value
    var index: Value
    
    init(array: Value, index: Value) {
        self.array = array
        self.index = index
    }
    
    func run(with variables: Binding<Variables>) async throws -> VariableValue {
        guard
            let index = try await index.value(with: variables) as? Int,
            let array = try await array.value(with: variables) as? ArrayValue
        else { throw VariableValueError.wrongTypeForOperation }
        
        guard let value = array.elements[safe: index] else {
            throw VariableValueError.valueNotFoundForVariable(index.protoString)
        }
        
        return value
    }
}

extension ArrayValueStep {
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .array: array = value as! Value
        case .index: array = value as! Value
        }
    }
    
    static func make(factory: (Properties) -> VariableValue) -> ArrayValueStep {
        .init(
            array: factory(.array) as! Value,
            index: factory(.index) as! Value
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .array: return array
        case .index: return index
        }
    }
    
    enum Properties: String, ViewProperty {
        case array
        case index
        
        var defaultValue: VariableValue {
            switch self {
            case .array: return Variable(name: StringValue(value: "ARRAY"))
            case .index: return 0
            }
        }
    }
}
