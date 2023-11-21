//
//  SetVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

final class SetVarStep: Step, ObservableObject {
    
    static var title: String { "Set variable" }
    @Published var varName: Value
    @Published var value: Value
    
    required init(varName: Value, value: Value) {
        self.varName = varName
        self.value = value
//        self.type = type
    }
    
    var protoString: String { "{ $\(varName) = \(value.protoString) }" }
    
    func run(with variables: inout Variables) throws {
        variables.set(try value.string(with: &variables), for: try varName.string(with: &variables))
    }
    
    static func make(factory: (Properties) -> VariableValue) -> Self {
        .init(
            varName: factory(.name) as! Value,
            value: factory(.value) as! Value
//            type: factory(.type) as! VariableType
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .name: varName
        case .value: value
//        case .type: type
        }
    }
        
    func set(_ value: VariableValue, for property: Properties) {
        objectWillChange.send()
        switch property {
        case .name: varName = value as! Value
        case .value: self.value = value as! Value
//        case .type: type = value as! VariableType
        }
    }
    
    enum Properties: String, ViewProperty {
        case name
        case value
//        case type
        
        var defaultValue: VariableValue {
            switch self {
            case .name: return "Text"
            case .value: return Variable(name: "$0")
//            case .type: return VariableType.string
            }
        }
    }
}
