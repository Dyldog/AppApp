//
//  ViewEditable+Constructor.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import Foundation

extension CompositeEditableVariableValue {
    var properties: [Properties: Any] {
        Properties.allCases.reduce(into: [:], {
            $0[$1] = value(for: $1) ?? $1.defaultValue
        })
    }
    
    var constructor: some ViewConstructor {
        EditableViewConstructor<Self>(properties: properties) { props in
            Self.make {
                props[$0] ?? $0.defaultValue
            }
        }
    }
}
