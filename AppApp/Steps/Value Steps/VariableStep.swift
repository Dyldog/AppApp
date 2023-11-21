//
//  VariableStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

final class VariableStep: ValueStep {
    static var title: String { "Get variable" }
    @Published var varName: Value
    @Published var type: VariableType
    
    init(varName: Value, type: VariableType) {
        self.varName = varName
        self.type = type
    }
    
    var protoString: String { "{ $\(varName) }" }
    
    func run(with variables: inout Variables) throws -> VariableValue {
        guard
            let nameValue = try varName.value(with: &variables),
            let value = variables.value(for: nameValue.valueString)
        else { throw VariableValueError.valueNotFoundForVariable }
        
        guard let typedValue = try value.value(with: &variables)
        else { throw VariableValueError.wrongTypeForOperation }
        
        
        return typedValue
    }
    
    static func make(factory: (Properties) -> VariableValue) -> VariableStep {
        return VariableStep(
            varName: factory(.varName) as! Value,
            type: factory(.type) as! VariableType
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .varName: return varName
        case .type: return type
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .varName: self.varName = value as! Value
        case .type: self.type = value as! VariableType
        }
    }
    
    enum Properties: String, ViewProperty {
        case varName
        case type
        
        var defaultValue: VariableValue {
            switch self {
            case .varName: return Variable(name: "VAR" as Value)
            case .type: return VariableType.string
            }
        }
    }
}
