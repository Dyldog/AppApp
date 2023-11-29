//
//  DictionaryKeysStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 29/11/2023.
//

import SwiftUI

final class  DictionaryKeysStep: ValueStep {
    
    static var title: String { "Get all keys from a dictionary" }
    var dictionary: TypedValue<DictionaryValue>
    
    init(dictionary: TypedValue<DictionaryValue>) {
        self.dictionary = dictionary
    }
    
    var protoString: String { "{ \(dictionary.protoString).KEYS }" }
    var valueString: String { "{ \(dictionary.valueString).KEYS }" }
    
    static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .dictionary: return TypedValue(value: .constant(DictionaryValue.makeDefault()))
        }
    }
    func run(with variables: Variables) async throws -> VariableValue {
        let dictionary: DictionaryValue = try await dictionary.value(with: variables)
        return ArrayValue(type: .string, elements: Array(dictionary.elements.keys))
    }
}

