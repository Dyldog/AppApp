//
//  MapStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 9/12/2023.
//

import SwiftUI
import Armstrong

final class MapStep: ValueStep {
    static var title: String { "Map values" }
    
    var value: TypedValue<ArrayValue>
    var mapper: StepArray
    
    var protoString: String { value.protoString }
    var valueString: String { value.valueString }
    
    init(value: TypedValue<ArrayValue>, mapper: StepArray) {
        self.value = value
        self.mapper = mapper
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return TypedValue.value(ArrayValue(type: .string, elements: []))
        case .mapper: return StepArray(value: [])
        }
    }
    
    func run(with variables: Variables) async throws -> VariableValue {
        var outputs: [any EditableVariableValue] = []
        
        for value in try await value.value.value(with: variables).elements {
            let variables = await variables.copy()
            let value = try await value.value(with: variables)
            await variables.set(value, for: "$INPUT")
            try await mapper.run(with: variables)
            guard let returnValue = await variables.value(for: "$0") else {
                throw Error.noValueReturnedFromMap
            }
            outputs.append(try await returnValue.value(with: variables))
        }
        
        return ArrayValue(type: outputs.first.map { Swift.type(of: $0).type } ?? .string, elements: outputs)
    }
}

extension MapStep {
    var codeRepresentation: String {
        value.valueString
    }
}


extension MapStep {
    enum Error: Swift.Error {
        case noValueReturnedFromMap
    }
}
