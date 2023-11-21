//
//  DictionaryValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

final class DictionaryValue: VariableValue, ObservableObject {
    
    static var type: VariableType { .list }
    
    @Published var type: VariableType
    @Published var elements: [StringValue: any VariableValue]
    
    var protoString: String {
        """
        {
        \(elements.map { "\t\($0.key.protoString): \($0.value.protoString)" }.joined(separator: ", "))
        }
        """
    }
    
    init(type: VariableType, elements: [StringValue: any VariableValue]) {
        self.type = type
        self.elements = elements
    }
    
    var valueString: String {
        elements.map { "\($0.key.valueString): \($0.value.valueString)" }.joined(separator: ", ")
    }
    
    func value(with variables: inout Variables) throws -> VariableValue? {
        return DictionaryValue(
            type: type,
            elements: try elements.compactMapValues { try $0.value(with: &variables) }
        )
    }
    
    func add(_ other: VariableValue) throws -> VariableValue {
        if let otherArray = other as? DictionaryValue, otherArray.type == type {
            elements.merge(otherArray.elements, uniquingKeysWith: { _, new in new })
            return self
        } else {
            throw VariableValueError.wrongTypeForOperation
        }
    }
    
    func update(oldKey: StringValue, to newKey: StringValue) throws -> VariableValue {
        guard let value = elements[oldKey] else { throw VariableValueError.valueNotFoundForVariable }
        elements.removeValue(forKey: oldKey)
        elements[newKey] = value
        return self
    }
    
    func editView(title: String, onUpdate: @escaping (DictionaryValue) -> Void) -> AnyView {
        HStack {
            Text(protoString)
            SheetButton(title: { Text(title) }) {
                DictionaryEditView(value: .init(get: {
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
