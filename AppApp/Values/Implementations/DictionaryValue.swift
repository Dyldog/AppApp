//
//  DictionaryValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

//final class DictionaryValue: VariableValue, ObservableObject {
//    
//    static var type: VariableType { .dictionary }
//    
//    @Published var type: VariableType
//    @Published var elements: [StringValue: any VariableValue]
//    
//    var protoString: String {
//        """
//        {
//        \(elements.map { "\t\($0.key.protoString): \($0.value.protoString)" }.joined(separator: ", "))
//        }
//        """
//    }
//    
//    init(type: VariableType, elements: [StringValue: any VariableValue]) {
//        self.type = type
//        self.elements = elements
//    }
//    
//    var valueString: String {
//        elements.map { "\($0.key.valueString): \($0.value.valueString)" }.joined(separator: ", ")
//    }
//    
//    func value(with variables: Binding<Variables>) async throws -> VariableValue? {
//        var mapped: [StringValue: (any VariableValue)?] = [:]
//        for (key, value) in elements {
//            mapped[key] = try await value.value(with: variables)
//        }
//        
//        return DictionaryValue(
//            type: type,
//            elements: elements.compactMapValues { $0 }
//        )
//    }
//    
//    func add(_ other: VariableValue) throws -> VariableValue {
//        if let otherArray = other as? DictionaryValue, otherArray.type == type {
//            elements.merge(otherArray.elements, uniquingKeysWith: { _, new in new })
//            return self
//        } else {
//            throw VariableValueError.wrongTypeForOperation
//        }
//    }
//    
//    func update(oldKey: StringValue, to newKey: StringValue) throws -> VariableValue {
//        guard let value = elements[oldKey] else { throw VariableValueError.valueNotFoundForVariable(oldKey.protoString) }
//        elements.removeValue(forKey: oldKey)
//        elements[newKey] = value
//        return self
//    }
//    
//    func editView(title: String, onUpdate: @escaping (DictionaryValue) -> Void) -> AnyView {
//        HStack {
//            Text(protoString)
//            SheetButton(title: { Text(title) }) {
//                DictionaryEditView(value: .init(get: {
//                    self
//                }, set: {
//                    onUpdate($0)
//                }), onUpdate: {
//                    onUpdate($0)
//                })
//            }.any
//        }.any
//    }
//}
//
//extension DictionaryValue: Codable {
//    enum CodingKeys: String, CodingKey {
//        case type
//        case elements
//    }
//    
//    convenience init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.init(
//            type: try container.decode(VariableType.self, forKey: .type),
//            elements: try container.decode(CodableVariableDictionary.self, forKey: .elements).values
//        )
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(CodableVariableDictionary(variables: elements), forKey: .elements)
//        try container.encode(type, forKey: .type)
//    }
//}
//
