//
//  EditableVariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 26/11/2023.
//

import SwiftUI

protocol PrimitiveEditableVariableValue: EditableVariableValue where Properties: PrimitiveViewProperty {
    associatedtype PrimitiveValue
    var value: PrimitiveValue { get set }
    static var defaultValue: PrimitiveValue { get }
}

extension PrimitiveEditableVariableValue {
    static func defaultValue(for property: Properties) -> Any {
        switch property {
        case .value: return Self.defaultValue
        default: fatalError()
        }
    }
}

extension PrimitiveEditableVariableValue {
    func propertyRow(title: String, onUpdate: @escaping (Self) -> Void) -> [(String, any PrimitiveEditableVariableValue, VariableUpdater)] {
        [(title, self, {
            self.set(($0 as! any PrimitiveEditableVariableValue).value, for: .value)
            onUpdate(self)
        })]
    }
}

protocol EditableVariableValue: VariableValue, ViewEditable {
    func editView(onUpdate: @escaping (Self) -> Void) -> AnyView
    static func defaultValue(for property: Properties) -> Any
}

protocol CompositeEditableVariableValue: EditableVariableValue {
    func propertyRows(onUpdate: @escaping (Self) -> Void) -> [(String, any PrimitiveEditableVariableValue, VariableUpdater)]
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
                return primitive.propertyRow(title: key.rawValue) {
                    self.set($0, for: key)
                    onUpdate(self)
                }
            } else {
                fatalError()
            }
        }
    }
}

extension CompositeEditableVariableValue {
    func editView(onUpdate: @escaping (Self) -> Void) -> AnyView {
        List {
            ForEach(enumerated: propertyRows(onUpdate: onUpdate).map { ($0.0, $0.1, $0.2) }) { (index, row) in
                HStack {
                    Text(row.0)
                    row.1.editView { value in
                        row.2(value)
                        onUpdate(self)
                    }
                }
            }
        }.any
    }
}
