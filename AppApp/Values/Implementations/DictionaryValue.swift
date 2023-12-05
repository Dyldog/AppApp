//
//  DictionaryValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class DictionaryValue: EditableVariableValue, ObservableObject {
    
    static var type: VariableType { .dictionary }
    
    @Published var type: VariableTypeValue
    @Published var elements: [StringValue: any EditableVariableValue]
    
    var protoString: String {
        """
        {
        \(elements.map { "\t\($0.key.protoString): \($0.value.protoString)" }.joined(separator: ", "))
        }
        """
    }
    
    var valueString: String {
        elements.map { "\($0.key.valueString): \($0.value.valueString)" }.joined(separator: ", ")
    }
    
    init(type: VariableTypeValue, elements: [StringValue: any EditableVariableValue]) {
        self.type = type
        self.elements = elements
    }
    
    static func makeDefault() -> DictionaryValue {
        .init(
            type: VariableTypeValue(value: .string),
            elements: [StringValue: any EditableVariableValue]()
        )
    }
    
    func value(with variables: Variables) async throws -> VariableValue {
        var mapped: [StringValue: (any VariableValue)?] = [:]
        for (key, value) in elements {
            mapped[key] = try await value.value(with: variables)
        }
        
        return DictionaryValue(
            type: type,
            elements: elements.compactMapValues { $0 }
        )
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        if let otherArray = other as? DictionaryValue, otherArray.type.value == type.value {
            elements.merge(otherArray.elements, uniquingKeysWith: { _, new in new })
            return self
        } else {
            throw VariableValueError.wrongTypeForOperation
        }
    }
    
    func update(oldKey: StringValue, to newKey: StringValue) throws -> VariableValue {
        guard let value = elements[oldKey] else { throw VariableValueError.valueNotFoundForVariable(oldKey.protoString) }
        elements.removeValue(forKey: oldKey)
        elements[newKey] = value
        return self
    }
    
    func editView(title: String, onUpdate: @escaping (DictionaryValue) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Image(systemName: "ellipsis.circle.fill") }) {
                DictionaryEditView(title: title, value: .init(get: {
                    self
                }, set: {
                    self.elements = $0.elements
                }), onUpdate: {
                    self.elements = $0.elements
                })
            } onDismiss: {
                onUpdate(self)
            }.any
        }.any
    }
}

extension DictionaryValue: Codable {
    enum CodingKeys: String, CodingKey {
        case type
        case elements
    }
    
    convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.init(
            type: try container.decode(VariableTypeValue.self, forKey: .type),
            elements: try container.decode(CodableVariableDictionary.self, forKey: .elements).values
        )
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(CodableVariableDictionary(variables: elements), forKey: .elements)
        try container.encode(type, forKey: .type)
    }
}


extension DictionaryValue {
    static func from(_ dictionary: [String: Any]) -> DictionaryValue {
        return DictionaryValue(
            type: VariableTypeValue(value: .string),
            elements: dictionary.reduce(into: [StringValue: any EditableVariableValue](), {
                let value: VariableValue
                switch $1.value {
                case let string as String: value = StringValue(value: string)
                case let float as Float: value = FloatValue(value: float)
                case let int as Int: value = IntValue(value: int)
                case let nsNumber as NSNumber: value = FloatValue(value: nsNumber.floatValue)
                // TODO: Handle array generically
                case let array as Array<String>:
                    value = ArrayValue(type: .string, elements: array.map { StringValue(value: $0) })
                case let array as Array<Int>:
                    value = ArrayValue(type: .int, elements: array.map { IntValue(value: $0) })
                case let array as Array<Float>:
                    value = ArrayValue(type: .float, elements: array.map { FloatValue(value: $0) })
                case let dictionary as [String: Any]:
                    value = DictionaryValue.from(dictionary)
                default: fatalError()
                }
                
                $0[StringValue(value: $1.key)] = value as? any EditableVariableValue
            })
        )
    }
    
    // (try JSONSerialization.jsonObject(
//with: value.valueString.data(using: .utf8)!,
//options: []
//) as! [String: Any])
}

extension DictionaryValue: CodeRepresentable {
    var codeRepresentation: String {
        """
        [
        \(elements.map { "\t\($0.key.codeRepresentation): \($0.value.codeRepresentation)"})
        ]
        """
    }
}
