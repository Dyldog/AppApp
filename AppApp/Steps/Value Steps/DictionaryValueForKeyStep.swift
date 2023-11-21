//
//  DictionaryValueForKeyStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

final class  DictionaryValueForKeyStep: ValueStep {
    static var title: String { "Get a value from a dictionary" }
    @Published var dictionary: Value
    @Published var key: Value
    
    init(dictionary: Value, key: Value) {
        self.dictionary = dictionary
        self.key = key
    }
    
    var protoString: String { "{ \(dictionary.protoString)[\(key.protoString)] }" }
    
    func run(with variables: inout Variables) throws -> VariableValue {
        guard
            let key = try key.value(with: &variables),
            let dictionary = try dictionary.value(with: &variables) as? DictionaryValue
        else { throw VariableValueError.wrongTypeForOperation }
        
        guard let value = dictionary.elements[StringValue(value: key.valueString)] else {
            throw VariableValueError.valueNotFoundForVariable
        }
        
        return value
    }
    
    static func make(factory: (Properties) -> VariableValue) -> DictionaryValueForKeyStep {
        return DictionaryValueForKeyStep(
            dictionary: factory(.dictionary) as! Value, 
            key: factory(.key) as! Value
        )
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .key: return key
        case .dictionary: return dictionary
        }
    }
    
    func set(_ value: VariableValue, for property: Properties) {
        switch property {
        case .key: self.key = value as! Value
        case .dictionary: self.dictionary = value as! Value
        }
    }
    
    enum Properties: String, ViewProperty {
        case dictionary
        case key
        
        var defaultValue: VariableValue {
            switch self {
            case .key: return "KEY" as Value
            case .dictionary: return DictionaryValue(type: .string, elements: [:])
            }
        }
    }
}
