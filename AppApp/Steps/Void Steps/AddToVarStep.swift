//
//  AddToVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

final class AddToVarStep: Step, ObservableObject {
    
    static var title: String { "Add to variable" }
    @Published var varName: String
    @Published var value: VariableValue
    @Published var type: VariableType
    
    required init(varName: String, value: VariableValue, type: VariableType) {
        self.varName = varName
        self.value = value
        self.type = type
    }
    
    var protoString: String { "{ $\(varName) += \(value.protoString) }"
        
    }
    
    func run(with variables: inout Variables) throws {
        guard let variable = variables.value(for: varName) else { throw Error.cantAddToUnsetVariable }
        guard
            let typedValue = type.value(from: try value.string(with: &variables)),
            let typedVariable = type.value(from: try variable.string(with: &variables)),
            Swift.type(of: typedValue) == Swift.type(of: typedVariable)
        else {
            throw VariableValueError.wrongTypeForOperation
        }
            
        variables.set(try typedVariable.add(typedValue), for: varName)
    }
    
    static func make(factory: (Properties) -> VariableValue) -> Self {
        .init(
            varName: factory(.name) as! String,
            value: factory(.value),
            type: factory(.type) as! VariableType
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .name: varName
        case .value: value
        case .type: type
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .name: varName = value.protoString
        case .value: self.value = value
        case .type: type = value as! VariableType
        }
    }
    
    enum Properties: String, ViewProperty {
        case name
        case value
        case type
        
        var defaultValue: VariableValue {
            switch self {
            case .name: return "Text"
            case .value: return "VariableValue"
            case .type: return VariableType.string
            }
        }
    }
    
    enum Error: StepError, Swift.Error {
        case cantAddToUnsetVariable
    }
}
