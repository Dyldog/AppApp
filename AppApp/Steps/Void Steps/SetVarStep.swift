//
//  SetVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class SetVarStep: Step {
    
    static var title: String { "Set variable" }
    static var type: VariableType { fatalError() }
    
    var varName: Value
    var value: Value
    
    init(varName: Value, value: Value) {
        self.varName = varName
        self.value = value
    }
    
    var protoString: String { "{ $\(varName.protoString) = \(value.protoString) }" }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .value: return Value(value: StringValue(value: "TEXT"))
        case .varName: return Value(value: Variable(value: StringValue(value: "VAR")))
        }
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        fatalError()
    }
}
