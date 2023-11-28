//
//  DecodeDictionaryStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class DecodeDictionaryStep: ValueStep {
    static var title: String { "Decode a dictionary from JSON" }
    var value: Value
    
    var protoString: String { "{ DECODE($\(value.protoString)) }" }
    var valueString: String { "{ DECODE($\(value.valueString)) }" }
    
    init(value: Value) {
        self.value = value
    }
    
    static func defaultValue(for property: Properties) -> any EditableVariableValue {
        switch property {
        case .value: return Value(value: Variable(value: StringValue(value: "$0")))
        }
    }
    
    func run(with variables: Variables) async throws -> VariableValue {
        let value = try await value.value(with: variables)
        
        return DictionaryValue(type: VariableTypeValue(value: .string), elements: (try JSONSerialization.jsonObject(
            with: value.valueString.data(using: .utf8)!,
            options: []
        ) as! [String: Any]).reduce(into: [StringValue: any EditableVariableValue](), {
            let value: VariableValue
            switch $1.value {
            case let string as String: value = StringValue(value: string)
            case let int as Int: value = IntValue(value: int)
            case let array as Array<String>:
                value = ArrayValue(type: .string, elements: array.map { StringValue(value: $0) })
            case let array as Array<Int>:
                value = ArrayValue(type: .int, elements: array.map { IntValue(value: $0) })
            default: fatalError()
            }
            
            $0[StringValue(value: $1.key)] = value as? any EditableVariableValue
        }))
    }
}
