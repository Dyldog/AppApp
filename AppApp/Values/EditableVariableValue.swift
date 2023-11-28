//
//  EditableVariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 26/11/2023.
//

import SwiftUI

protocol EditableVariableValue: AnyObject, VariableValue, ViewEditable {
    static func makeDefault() -> Self
    func editView(onUpdate: @escaping (Self) -> Void) -> AnyView
}

protocol PrimitiveEditableVariableValue: EditableVariableValue where Primitive.AllCases: RandomAccessCollection {
    associatedtype Primitive: CaseIterable & Hashable & Titleable
    var value: Primitive { get set }
}

extension PrimitiveEditableVariableValue {
    func editView(onUpdate: @escaping (Self) -> Void) -> AnyView {
        Picker("", selection: .init(get: { [weak self] in
            self?.value ?? Self.makeDefault().value
        }, set: { [weak self] new in
            guard let self = self else { return }
            self.value = new
            onUpdate(self)
        })) {
            ForEach(Primitive.allCases) {
                Text($0.title).tag($0)
            }
        }.pickerStyle(.menu).any
    }
}

protocol CompositeEditableVariableValue: EditableVariableValue {
    func propertyRows(onUpdate: @escaping (Self) -> Void) -> [(String, any PrimitiveEditableVariableValue, VariableUpdater)]
    
    associatedtype Properties: ViewProperty
    static func make(factory: (Properties) -> any EditableVariableValue) -> Self
    func value(for property: Properties) -> any EditableVariableValue
    func set(_ value: Any, for property: Properties)
    static func defaultValue(for property: Properties) -> any EditableVariableValue
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
