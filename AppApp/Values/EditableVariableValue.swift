//
//  EditableVariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 26/11/2023.
//

import SwiftUI

protocol EditableVariableValue: VariableValue, ViewEditable {
    func editView(onUpdate: @escaping (Self) -> Void) -> AnyView
}

protocol PrimitiveEditableVariableValue: EditableVariableValue { }

protocol CompositeEditableVariableValue: EditableVariableValue {
    func propertyRows(onUpdate: @escaping (Self) -> Void) -> [(String, any PrimitiveEditableVariableValue, VariableUpdater)]
    
    associatedtype Properties: ViewProperty
    static func make(factory: (Properties) -> Any) -> Self
    func value(for property: Properties) -> Any?
    func set(_ value: Any, for property: Properties)
    static func defaultValue(for property: Properties) -> Any
}

typealias VariableUpdater = (any EditableVariableValue) -> Void
extension CompositeEditableVariableValue {
    func propertyRows(
        onUpdate: @escaping (Self) -> Void
    ) -> [(String, any PrimitiveEditableVariableValue, VariableUpdater)] {
        properties.flatMap { (key, value) in
            if let composite = value as? any CompositeEditableVariableValue {
                return composite.propertyRows(onUpdate: { value in
                    self.set(value, for: key)
                    onUpdate(self)
                })
            } else if let primitive = value as? any PrimitiveEditableVariableValue {
                return [(key.rawValue, primitive, {
                    self.set($0, for: key)
                    onUpdate(self)
                })]
            } else {
                fatalError()
            }
        }.sorted(by: { $0.0 < $1.0 })
    }
}

extension CompositeEditableVariableValue {
    func editView(onUpdate: @escaping (Self) -> Void) -> AnyView {
        VStack(alignment: .leading) {
            ForEach(enumerated: propertyRows(onUpdate: onUpdate).map { ($0.0, $0.1, $0.2) }) { (index, row) in
                HStack {
                    Text(row.0)
                    row.1.editView { value in
                        row.2(value)
                        onUpdate(self)
                    }
                }
            }
            .padding()
        }.any
    }
}
