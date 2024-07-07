//
//  MapStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 9/12/2023.
//

import SwiftUI
import Armstrong

public final class MapStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.looping]
    public static var type: VariableType { .mapStep }
    public static var title: String { "Map values" }
    
    public var value: TypedValue<ArrayValue>
    public var mapper: StepArray
    
    public var protoString: String { value.protoString }
    public var valueString: String { value.valueString }
    
    public init(value: TypedValue<ArrayValue>, mapper: StepArray) {
        self.value = value
        self.mapper = mapper
    }
    
    public static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return TypedValue.value(ArrayValue(type: .string, elements: []))
        case .mapper: return StepArray(value: [])
        }
    }
    
    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        var outputs: [any EditableVariableValue] = []
        
        for value in try value.value.value(with: variables, and: scope).elements {
            let variables =  variables.copy()
            let value = try value.value(with: variables, and: scope)
             variables.set(value, for: "$INPUT")
            try mapper.run(with: variables, and: scope)
            guard let returnValue =  variables.value(for: "$0") else {
                throw Error.noValueReturnedFromMap
            }
            outputs.append(try returnValue.value(with: variables, and: scope))
        }
        
        return ArrayValue(type: outputs.first.map { Swift.type(of: $0).type } ?? .string, elements: outputs)
    }
}

extension MapStep {
    public var codeRepresentation: String {
        value.valueString
    }
}


extension MapStep {
    enum Error: Swift.Error {
        case noValueReturnedFromMap
    }
}
