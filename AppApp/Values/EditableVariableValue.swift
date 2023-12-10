//
//  EditableVariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 26/11/2023.
//

import SwiftUI
import Armstrong

protocol PrimitiveEditableVariableValue: EditableVariableValue where Primitive.AllCases: RandomAccessCollection {
    associatedtype Primitive: CaseIterable & Hashable & Titleable & CodeRepresentable
    var value: Primitive { get set }
}

extension PrimitiveEditableVariableValue {
    var codeRepresentation: String { value.codeRepresentation }
}

extension PrimitiveEditableVariableValue {
    func editView(title: String, onUpdate: @escaping (Self) -> Void) -> AnyView {
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

extension CompositeEditableVariableValue {
    func propertyRows(
        onUpdate: @escaping (Self) -> Void
    ) -> [(String, any EditableVariableValue, VariableUpdater)] {
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
                return [(key.rawValue, value, {
                    self.set($0, for: key)
                    onUpdate(self)
                })]
            }
        }.sorted(by: { $0.0 < $1.0 })
    }
}

extension CompositeEditableVariableValue {
    func editView(title: String, onUpdate: @escaping (Self) -> Void) -> AnyView {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(enumerated: propertyRows(onUpdate: onUpdate).map { ($0.0, $0.1, $0.2) }) { (index, row) in
                HStack {
                    Text(row.0.titleCase()).bold()
                    Spacer()
                    row.1.editView(title: row.0) { value in
                        row.2(value)
                        onUpdate(self)
                    }.multilineTextAlignment(.trailing)
                }
            }
        }.any
    }
}
