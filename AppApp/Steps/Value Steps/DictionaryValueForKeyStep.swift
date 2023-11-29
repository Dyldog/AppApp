//
//  DictionaryValueForKeyStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class  DictionaryValueForKeyStep: ValueStep {
    
    static var title: String { "Get a value from a dictionary" }
    var dictionary: TypedValue<DictionaryValue>
    var key: AnyValue
    
    init(dictionary: TypedValue<DictionaryValue>, key: AnyValue) {
        self.dictionary = dictionary
        self.key = key
    }
    
    var protoString: String { "{ \(dictionary.protoString)[\(key.protoString)] }" }
    var valueString: String { "{ \(dictionary.valueString)[\(key.valueString)] }" }
    
    static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .dictionary: return TypedValue(value: .constant(DictionaryValue.makeDefault()))
        case .key: return StringValue(value: "KEY").any
        }
    }
    func run(with variables: Variables) async throws -> VariableValue {
        let key = try await key.value(with: variables)
        
        guard
            let dictionary = try await dictionary.value(with: variables) as? DictionaryValue
        else { throw VariableValueError.wrongTypeForOperation }
        
        guard let value = dictionary.elements[StringValue(value: key.valueString)] else {
            throw VariableValueError.valueNotFoundForVariable(key.protoString)
        }
        
        return value
    }
}
