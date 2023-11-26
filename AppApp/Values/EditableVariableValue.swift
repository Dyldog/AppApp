//
//  EditableVariableValue.swift
//  AppApp
//
//  Created by Dylan Elliott on 26/11/2023.
//

import SwiftUI

protocol PrimitiveEditableVariableValue: EditableVariableValue where Properties: PrimitiveViewProperty {
    
}

extension PrimitiveEditableVariableValue {
    var propertyRows: [(String, any PrimitiveEditableVariableValue)] {
        [(Properties.value.rawValue, self)]
    }
}

protocol EditableVariableValue: VariableValue, ViewEditable {
    func editView(onUpdate: @escaping (Self) -> Void) -> AnyView
    var propertyRows: [(String, any PrimitiveEditableVariableValue)] { get }
}

protocol CompositeEditableVariableValue: EditableVariableValue {
    
}

extension CompositeEditableVariableValue {
    var propertyRows: [(String, any PrimitiveEditableVariableValue)] {
        properties.flatMap {
            if let composite = $0.value as? any CompositeEditableVariableValue {
                return composite.propertyRows
            } else if let primitive = $0.value as? any PrimitiveEditableVariableValue {
                return [($0.key.rawValue, primitive)]
            } else {
                fatalError()
            }
        }
    }
}

extension CompositeEditableVariableValue {
    func editView(onUpdate: @escaping (Self) -> Void) -> AnyView {
        List {
            ForEach(propertyRows.map { ($0.0, $0.1) }, id: \.0) { row in
                HStack {
                    Text(row.0)
                    row.1.editView { value in
                        guard let property = Properties(rawValue: row.0) else { return }
                        self.set(value, for: property)
                        onUpdate(self)
                    }
                }
            }
        }.any
    }
}
