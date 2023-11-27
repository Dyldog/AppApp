//
//  DictionaryValueForKeyStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

//final class  DictionaryValueForKeyStep: ValueStep {
//    static var title: String { "Get a value from a dictionary" }
//    @Published var dictionary: Value
//    @Published var key: Value
//    
//    init(dictionary: Value, key: Value) {
//        self.dictionary = dictionary
//        self.key = key
//    }
//    
//    var protoString: String { "{ \(dictionary.protoString)[\(key.protoString)] }" }
//    
//    func run(with variables: Variables) async throws -> VariableValue {
//        guard
//            let key = try await key.value(with: variables),
//            let dictionary = try await dictionary.value(with: variables) as? DictionaryValue
//        else { throw VariableValueError.wrongTypeForOperation }
//        
//        guard let value = dictionary.elements[StringValue(value: key.valueString)] else {
//            throw VariableValueError.valueNotFoundForVariable(key.protoString)
//        }
//        
//        return value
//    }
//    
//    static func make(factory: (Properties) -> VariableValue) -> DictionaryValueForKeyStep {
//        return DictionaryValueForKeyStep(
//            dictionary: factory(.dictionary) as! Value, 
//            key: factory(.key) as! Value
//        )
//    }
//    
//    func value(for property: Properties) -> (VariableValue)? {
//        switch property {
//        case .key: return key
//        case .dictionary: return dictionary
//        }
//    }
//    
//    func set(_ value: VariableValue, for property: Properties) {
//        switch property {
//        case .key: self.key = value as! Value
//        case .dictionary: self.dictionary = value as! Value
//        }
//    }
//    
//    enum Properties: String, ViewProperty {
//        case dictionary
//        case key
//        
//        var defaultValue: VariableValue {
//            switch self {
//            case .key: return "KEY" as Value
//            case .dictionary: return DictionaryValue(type: .string, elements: [:])
//            }
//        }
//    }
//}
//
//extension DictionaryValueForKeyStep: Codable {
//    enum CodingKeys: String, CodingKey {
//        case dictionary
//        case key
//    }
//    
//    convenience init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.init(
//            dictionary: try container.decode(Value.self, forKey: .dictionary),
//            key: try container.decode(Value.self, forKey: .key)
//        )
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(dictionary, forKey: .dictionary)
//        try container.encode(key, forKey: .key)
//    }
//}
