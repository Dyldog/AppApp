//
//  ArrayValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

// sourcery: variableTypeName = "list"
final class ArrayValue: EditableVariableValue, ObservableObject {
    
    static var type: VariableType { .list }
    
    var type: VariableType
    var elements: [any EditableVariableValue]
    
    var protoString: String { "[" + elements.map { $0.protoString }.joined(separator: ", ") + "]" }
    
    init(type: VariableType, elements: [any EditableVariableValue]) {
        self.type = type
        self.elements = elements
    }
    
    static func makeDefault() -> ArrayValue {
        .init(
            type: VariableType.string,
            elements: [any EditableVariableValue]()
        )
    }
    
    var valueString: String { 
        return "[\(elements.map { $0.valueString }.joined(separator: ", "))]"
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
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
    
    func editView(title: String, onUpdate: @escaping (ArrayValue) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Image(systemName: "ellipsis.circle.fill") }) {
                ListEditView(title: title, value: .init(get: { [weak self] in
                    self ?? .init(type: .int, elements: [IntValue(value: 666)])
                }, set: {
                    self.elements = $0.elements
//                    onUpdate(self)
                }), onUpdate: {
                    self.elements = $0.elements
                    onUpdate(self)
                })
            } onDismiss: {
                onUpdate(self)
            }.any
        }.any
    }
}

extension ArrayValue {
    static func from(_ array: [Any]) -> ArrayValue {
        let type: VariableType
        let elements: [any EditableVariableValue]
        
        switch array {
        case let strings as [String]:
            type = .string
            elements = strings.map { StringValue(value: $0) }
        case let ints as [Int]:
            type = .int
            elements = ints.map { IntValue(value: $0) }
        case let floats as [Float]:
            type = .float
            elements = floats.map { FloatValue(value: $0) }
        case let nsNumbers as [NSNumber]:
            type = .float
            elements = nsNumbers.map { FloatValue(value: $0.floatValue) }
        case let dictionaries as [[String: Any]]:
            type = .dictionary
            elements = dictionaries.map { DictionaryValue.from($0) }
        default:
            fatalError()
        }
        
        return ArrayValue(type: type, elements: elements)
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

extension ArrayValue: CodeRepresentable {
    var codeRepresentation: String {
        "[\(elements.map { $0.codeRepresentation }.joined(separator: ", "))]"
    }
}
