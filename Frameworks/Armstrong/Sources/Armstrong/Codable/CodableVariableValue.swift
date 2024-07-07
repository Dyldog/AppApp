//
//  CodableVariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 24/11/2023.
//

import Foundation

public struct CodableVariableValue {
    public let type: String
    public let value: any EditableVariableValue
    
    public init(value: any EditableVariableValue) {
        self.value = value
        self.type = typeString(Swift.type(of: value))
    }
}

extension CodableVariableValue: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case value
    }

    public init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        let decodedType = try valueContainer.decode(String.self, forKey: .type)
        
        for viewType in AALibrary.shared.values {
            if typeString(viewType) == decodedType {
                self.type = decodedType
                self.value = try valueContainer.decode(viewType, forKey: .value)
                return
            }
        }
        
        fatalError()
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(value, forKey: .value)
    }
}
