//
//  AddToVarStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

final class AddToVarStep: Step, ObservableObject {
    
    static var title: String { "Add to variable" }
    var varName: AnyValue
    var value: AnyValue
    
    var protoString: String { "{ $\(varName.protoString) += \(value.protoString) }" }
    var valueString: String { "{ $\(varName.valueString) += \(value.value) }" }
    
    init(varName: AnyValue, value: AnyValue) {
        self.varName = varName
        self.value = value
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return AnyValue(value: IntValue(value: 1))
        case .varName: return AnyValue(value: Variable(value: StringValue(value: "VAR")))
        }
    }
    
    func run(with variables: Variables) async throws {
        let varNameValue = try await varName.value(with: variables)
        
        guard let oldValue = await variables.value(for: varNameValue.valueString) else {
            throw VariableValueError.valueNotFoundForVariable(varNameValue.valueString)
        }
        let extraValue = try await value.value(with: variables)
        await variables.set(try oldValue.add(extraValue), for: varName.valueString)
    }
    
    enum Error: StepError, Swift.Error {
        case cantAddToUnsetVariable
    }
}

extension AddToVarStep: CodeRepresentable {
    var codeRepresentation: String {
        "\(varName.valueString) = \(varName.codeRepresentation) + \(value.codeRepresentation)"
    }
}
