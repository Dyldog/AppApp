//
//  ArrayValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class ArrayValue: VariableValue, ObservableObject {
    
    static var type: VariableType { .list }
    
    @Published var type: VariableType
    @Published var elements: [any VariableValue]
    var protoString: String { elements.map { $0.protoString }.joined(separator: ", ") }
    
    init(type: VariableType, elements: [any VariableValue]) {
        self.type = type
        self.elements = elements
    }
    
    var valueString: String { 
        return """
        [
        \t\(elements.map { $0.valueString }.joined(separator: ", "))
        ]
        """
    }
    
    func value(with variables: inout Variables) throws -> VariableValue? {
        return ArrayValue(
            type: type,
            elements: try elements.compactMap { (value: (any VariableValue)?) -> (any VariableValue)? in
                return try  value?.value(with: &variables)
            }
        )
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        if let otherArray = other as? ArrayValue, otherArray.type == type {
            elements += otherArray.elements
            return self
        } else {
            elements += [other]
            return self
        }
    }
    
    func editView(title: String, onUpdate: @escaping (ArrayValue) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Text(title) }) {
                ListEditView(value: .init(get: {
                    self
                }, set: {
                    onUpdate($0)
                }), onUpdate: {
                    onUpdate($0)
                })
            }.any
        }.any
    }
}

extension ArrayValue: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case elements
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            type: try container.decode(VariableType.self, forKey: .type),
            elements: try container.decode(CodableVariableList.self, forKey: .elements).values
        )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableVariableList(variables: elements), forKey: .elements)
        try container.encode(type, forKey: .type)
    }
}

