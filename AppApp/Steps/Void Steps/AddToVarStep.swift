//
//  AddToVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class AddToVarStep: Step, ObservableObject {
    
    static var title: String { "Add to variable" }
    var varName: Value
    var value: Value
    
    var protoString: String { "{ $\(varName.protoString) += \(value.protoString) }" }
    
    init(varName: Value, value: Value) {
        self.varName = varName
        self.value = value
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .value: return Value(value: IntValue(value: 1))
        case .varName: return Value(value: Variable(value: StringValue(value: "VAR")))
        }
    }
    
    func run(with variables: Variables) async throws {
        guard
            let oldValue = try await varName.value(with: variables),
            let extraValue = try await value.value(with: variables)
        else { throw Error.cantAddToUnsetVariable }
        
        await variables.set(try oldValue.add(extraValue), for: varName.valueString)
    }
    
    enum Error: StepError, Swift.Error {
        case cantAddToUnsetVariable
    }
}
