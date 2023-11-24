//
//  AddToVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class AddToVarStep: Step, ObservableObject, Codable {
    
    static var title: String { "Add to variable" }
    var varName: Value
    var value: Value
    
    required init(varName: Value, value: Value) {
        self.varName = varName
        self.value = value
    }
    
    var protoString: String { "{ $\(varName.protoString) += \(value.protoString) }" }
    
    func run(with variables: Binding<Variables>) async throws {
        guard
            let name = try await varName.value(with: variables),
            let oldValue = variables.wrappedValue.value(for: name.valueString) ,
            let extraValue = try await value.value(with: variables)
        else { throw Error.cantAddToUnsetVariable }
        
        variables.wrappedValue.set(try oldValue.add(extraValue), for: varName.valueString)
    }
    
    static func make(factory: (Properties) -> VariableValue) -> Self {
        .init(
            varName: factory(.name) as! Value,
            value: factory(.value) as! Value
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .name: varName
        case .value: value
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .name: varName = value as! Value
        case .value: self.value = value as! Value
        }
    }
    
    enum Properties: String, ViewProperty {
        case name
        case value
        
        var defaultValue: VariableValue {
            switch self {
            case .name: return "Text" as Value
            case .value: return "VariableValue" as Value
            }
        }
    }
    
    enum Error: StepError, Swift.Error {
        case cantAddToUnsetVariable
    }
}
