//
//  StaticValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

final class StaticValueStep: ValueStep {
    static var title: String { "Static value" }
    @Published var value: Value
    @Published var type: VariableType
    
    init(value: Value, type: VariableType) {
        self.value = value
        self.type = type
    }
    
    var protoString: String { value.protoString }
    
    func run(with variables: inout Variables) throws -> VariableValue {
        guard let typedValue = try value.value(with: &variables)
        else { throw VariableValueError.wrongTypeForOperation }
        return typedValue
    }
    
    static func make(factory: (Properties) -> VariableValue) -> StaticValueStep {
        return StaticValueStep(
            value: factory(.value) as! Value,
            type: factory(.type) as! VariableType
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .value: return value
        case .type: return type
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .value: self.value = value as! Value
        case .type: self.type = value as! VariableType
        }
    }
    
    enum Properties: String, ViewProperty {
        case value
        case type
        
        var defaultValue: VariableValue {
            switch self {
            case .value: return StringValue(value: "TITLE")
            case .type: return VariableType.string
            }
        }
    }
}
