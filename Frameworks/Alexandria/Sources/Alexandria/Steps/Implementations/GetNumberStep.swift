//
//  GetNumberStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 1/12/2023.
//

import Foundation
import Armstrong

public final class GetNumberStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.dataProcessing]
    public static var type: VariableType { .getNumberStep }
    public static var title: String { "Get number from value" }
    public var value: AnyValue
    public var numberType: NumericTypeValue
    
    public var protoString: String { "{ \(value.protoString) as \(numberType.protoString) }" }
    public var valueString: String { "{ \(value.valueString) as \(numberType.valueString) }" }
    
    public init(value: AnyValue, numberType: NumericTypeValue) {
        self.value = value
        self.numberType = numberType
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return AnyValue.string("123")
        case .numberType: return NumericTypeValue.init(value: .int)
        }
    }

    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let value = try value.value(with: variables, and: scope)
        return try numberType.value.make(from: value.valueString)
    }
}

extension GetNumberStep: CodeRepresentable {
    public var codeRepresentation: String {
        "\(value.codeRepresentation)"
    }
}
