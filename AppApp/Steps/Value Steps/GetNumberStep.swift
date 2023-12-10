//
//  GetNumberStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 1/12/2023.
//

import Foundation
import Armstrong

final class GetNumberStep: ValueStep {
    static var title: String { "Get number from value" }
    var value: AnyValue
    var numberType: NumericTypeValue
    
    var protoString: String { "{ \(value.protoString) as \(numberType.protoString) }" }
    var valueString: String { "{ \(value.valueString) as \(numberType.valueString) }" }
    
    init(value: AnyValue, numberType: NumericTypeValue) {
        self.value = value
        self.numberType = numberType
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return AnyValue.string("123")
        case .numberType: return NumericTypeValue.init(value: .int)
        }
    }

    func run(with variables: Variables) async throws -> VariableValue {
        let value = try await value.value(with: variables)
        return try numberType.value.make(from: value.valueString)
    }
}

extension GetNumberStep: CodeRepresentable {
    var codeRepresentation: String {
        "\(value.codeRepresentation)"
    }
}
