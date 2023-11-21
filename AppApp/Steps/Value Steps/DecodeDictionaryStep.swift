//
//  DecodeDictionaryStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

final class  DecodeDictionaryStep: ValueStep {
    static var title: String { "Decode a dictionary from JSON" }
    @Published var value: Value
    
    init(value: Value) {
        self.value = value
    }
    
    var protoString: String { "{ DECODE($\(value.protoString)) }" }
    
    func run(with variables: inout Variables) throws -> VariableValue {
        guard
            let value = try value.value(with: &variables)
        else { throw VariableValueError.wrongTypeForOperation }
        
        return DictionaryValue(type: .string, elements: (try JSONSerialization.jsonObject(
            with: value.valueString.data(using: .utf8)!,
            options: []
        ) as! [String: Any]).reduce(into: [StringValue: any VariableValue](), {
            let value: VariableValue
            switch $1.value {
            case let string as String: value = StringValue(value: string)
            case let int as Int: value = int
            case let array as Array<String>: 
                value = ArrayValue(type: .string, elements: array.map { StringValue(value: $0) })
            case let array as Array<Int>: 
                value = ArrayValue(type: .int, elements: array)
            default: fatalError()
            }
            
            $0[StringValue(value: $1.key)] = value
        }))
    }
    
    static func make(factory: (Properties) -> VariableValue) -> DecodeDictionaryStep {
        return DecodeDictionaryStep(
            value: factory(.value) as! Value
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .value: return value
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .value: self.value = value as! Value
        }
    }
    
    enum Properties: String, ViewProperty {
        case value
        
        var defaultValue: VariableValue {
            switch self {
            case .value: return Variable(name: "$0" as Value)
            }
        }
    }
}
