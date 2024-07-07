//
//  ArrayValueStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import SwiftUI
import Armstrong

public final class ArrayValueStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.containerSteps]
    public static var type: VariableType { .arrayStep }
    public static var title: String { "Get value from array" }
    
    public var protoString: String { "\(array.protoString)[\(index.protoString)]"}
    public var valueString: String { "\(array.valueString)[\(index.valueString)]"}
    
    public var array: AnyValue
    public var index: AnyValue
    
    public init(array: AnyValue, index: AnyValue) {
        self.array = array
        self.index = index
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .array: return AnyValue(value: Variable(value: StringValue(value: "$0").any))
        case .index: return AnyValue(value: IntValue(value: 0))
        }
    }
    
    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        guard
            let index = try index.value(with: variables, and: scope) as? IntValue,
            let array = try array.value(with: variables, and: scope) as? ArrayValue
        else { throw VariableValueError.wrongTypeForOperation }
        
        guard let value = array.elements[safe: index.value] else {
            throw VariableValueError.valueNotFoundForVariable(index.protoString)
        }
        
        return value
    }
}

extension ArrayValueStep: CodeRepresentable {
    public var codeRepresentation: String {
        "\(array.codeRepresentation)[\(index.codeRepresentation)]"
    }
}
