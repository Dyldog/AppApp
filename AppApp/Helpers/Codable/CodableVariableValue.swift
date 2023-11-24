//
//  CodableVariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Foundation

struct CodableVariableValue: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case value
    }
    
    let type: String
    let value: VariableValue
    
    init(value: VariableValue) {
        self.value = value
        self.type = typeString(Swift.type(of: value))
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.type = try valueContainer.decode(String.self, forKey: .type)
        
        switch type {
        case typeString(Value.self):
            self.value = try valueContainer.decode(Value.self, forKey: .value)
        case typeString(ActionValue.self):
            self.value = try valueContainer.decode(ActionValue.self, forKey: .value)
        case typeString(ArrayValue.self):
            self.value = try valueContainer.decode(ArrayValue.self, forKey: .value)
        case typeString(DictionaryValue.self):
            self.value = try valueContainer.decode(DictionaryValue.self, forKey: .value)
        case typeString(Variable.self):
            self.value = try valueContainer.decode(Variable.self, forKey: .value)
        case typeString(VariableType.self):
            self.value = try valueContainer.decode(VariableType.self, forKey: .value)
        case typeString(Int.self):
            self.value = try valueContainer.decode(Int.self, forKey: .value)
        case typeString(StringValue.self):
            self.value = try valueContainer.decode(StringValue.self, forKey: .value)
        default:
            fatalError(type)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        
        switch self.value {
        case let value as Value:
            try container.encode(value, forKey: .value)
        case let value as ActionValue:
            try container.encode(value, forKey: .value)
        case let value as ArrayValue:
            try container.encode(value, forKey: .value)
        case let value as DictionaryValue:
            try container.encode(value, forKey: .value)
        case let value as Variable:
            try container.encode(value, forKey: .value)
        case let value as VariableType:
            try container.encode(value, forKey: .value)
        case let value as Int:
            try container.encode(value, forKey: .value)
        case let value as StringValue:
            try container.encode(value, forKey: .value)
        default: fatalError()
        }
    }
}
