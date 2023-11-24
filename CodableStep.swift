//
//  CodableStep.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Foundation

struct CodableStep: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case value
    }
    
    let value: any StepType
    let type: String
    
    init(value: any StepType) {
        self.value = value
        self.type = typeString(Swift.type(of: value))
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.type = try valueContainer.decode(String.self, forKey: .type)
        
        switch type {
        case typeString(SetVarStep.self):
            self.value = try valueContainer.decode(SetVarStep.self, forKey: .value)
        case typeString(AddToVarStep.self):
            self.value = try valueContainer.decode(AddToVarStep.self, forKey: .value)
        case typeString(PrintVarStep.self):
            self.value = try valueContainer.decode(PrintVarStep.self, forKey: .value)
        case typeString(StaticValueStep.self):
            self.value = try valueContainer.decode(StaticValueStep.self, forKey: .value)
        case typeString(VariableStep.self):
            self.value = try valueContainer.decode(VariableStep.self, forKey: .value)
        case typeString(APIValueStep.self):
            self.value = try valueContainer.decode(APIValueStep.self, forKey: .value)
        case typeString(DecodeDictionaryStep.self):
            self.value = try valueContainer.decode(DecodeDictionaryStep.self, forKey: .value)
        case typeString(DictionaryValueForKeyStep.self):
            self.value = try valueContainer.decode(DictionaryValueForKeyStep.self, forKey: .value)
        case typeString(ArrayValueStep.self):
            self.value = try valueContainer.decode(ArrayValueStep.self, forKey: .value)
        default:
            fatalError(type)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        
        switch self.value {
        case let value as SetVarStep:
            try container.encode(value, forKey: .value)
        case let value as AddToVarStep:
            try container.encode(value, forKey: .value)
        case let value as PrintVarStep:
            try container.encode(value, forKey: .value)
        case let value as StaticValueStep:
            try container.encode(value, forKey: .value)
        case let value as VariableStep:
            try container.encode(value, forKey: .value)
        case let value as APIValueStep:
            try container.encode(value, forKey: .value)
        case let value as DecodeDictionaryStep:
            try container.encode(value, forKey: .value)
        case let value as DictionaryValueForKeyStep:
            try container.encode(value, forKey: .value)
        case let value as ArrayValueStep:
            try container.encode(value, forKey: .value)
        default: fatalError()
        }
    }
}
