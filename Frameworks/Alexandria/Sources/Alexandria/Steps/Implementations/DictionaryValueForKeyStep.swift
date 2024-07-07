//
//  DictionaryValueForKeyStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI
import Armstrong

public final class  DictionaryValueForKeyStep: ValueStep {
    
    public static let categories: [ValueCategory] = [.containerSteps]
    public static var type: VariableType { .dictionaryForKeyStep }
    public static var title: String { "Get a value from a dictionary" }
    
    public var dictionary: TypedValue<DictionaryValue>
    public var key: AnyValue
    public var errorIfNotFound: BoolValue
    
    public init(
        dictionary: TypedValue<DictionaryValue>,
        key: AnyValue,
        errorIfNotFound: BoolValue = .false
    ) {
        self.dictionary = dictionary
        self.key = key
        self.errorIfNotFound = errorIfNotFound
    }
    
    public var protoString: String { "{ \(dictionary.protoString)[\(key.protoString)] }" }
    public var valueString: String { "{ \(dictionary.valueString)[\(key.valueString)] }" }
    
    public static func defaultValue(for property: Properties) -> EditableVariableValue {
        switch property {
        case .dictionary: return TypedValue(value: .constant(DictionaryValue.makeDefault()))
        case .key: return StringValue(value: "KEY").any
        case .errorIfNotFound: return BoolValue.false
        }
    }
    
    public func run(with variables: Variables, and scope: Scope) throws -> VariableValue {
        let key = try key.value(with: variables, and: scope)
        
        guard
            let dictionary = try dictionary.value(with: variables, and: scope) as? DictionaryValue
        else {
            throw VariableValueError.wrongTypeForOperation
        }
        
        guard let value = dictionary.elements[key.valueString] else {
            if errorIfNotFound.value {
                throw VariableValueError.valueNotFoundForVariable(key.protoString)
            } else {
                return NilValue()
            }
        }
        
        return value
    }
}

extension DictionaryValueForKeyStep: CodeRepresentable {
    public var codeRepresentation: String {
        "\(dictionary.codeRepresentation)[\(key.codeRepresentation)]"
    }
}
