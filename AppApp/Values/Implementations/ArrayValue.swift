//
//  ArrayValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

// sourcery: variableTypeName = "list"
final class ArrayValue: CompositeEditableVariableValue, ObservableObject {
    
    static var type: VariableType { .list }
    
    var type: VariableType
    var elements: [any EditableVariableValue]
    
    var protoString: String { elements.map { $0.protoString }.joined(separator: ", ") }
    
    init(type: VariableType, elements: [any EditableVariableValue]) {
        self.type = type
        self.elements = elements
    }
    
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .type: return VariableType.string
        case .elements: return [any VariableValue]()
        }
    }
    
    var valueString: String { 
        return """
        [
        \t\(elements.map { $0.valueString }.joined(separator: ", "))
        ]
        """
    }
    
    func value(with variables: Variables) async throws -> VariableValue? {
        var mapped: [(any EditableVariableValue)?] = []
        for element in elements {
            mapped.append(try await element.value(with: variables) as? (any EditableVariableValue))
        }
        return ArrayValue(
            type: type,
            elements: mapped.compactMap { $0 }
        )
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        if let otherArray = other as? ArrayValue, otherArray.type == type {
            elements += otherArray.elements
            return self
        } else {
            elements += [other as! any EditableVariableValue]
            return self
        }
    }
    
    func editView(onUpdate: @escaping (ArrayValue) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Text("Edit") }) {
                ListEditView(value: .init(get: { [weak self] in
                    self ?? .init(type: .int, elements: [IntValue(value: 666)])
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

