//
//  MakeableField.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct MakeableField: MakeableView {
    @State var text: Value
    var onEdit: (() -> Void)?
    
    func view(variables: Binding<Variables>?, alert: Binding<Alert?>?) throws -> AnyView {
        func field(text: String) -> AnyView {
            return TextField("", text: .init(get: {
                text
            }, set: {
                self.text = Value(stringLiteral: $0)
                onEdit?()
            })).any
        }
        
        if var variables = variables?.wrappedValue {
            guard let value = try text.value(with: &variables)?.valueString
            else { throw VariableValueError.valueNotFoundForVariable }
            return field(text: value)
        } else {
            return field(text: text.protoString)
        }
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .text: return text
        }
    }
    
    static func make(factory: (Properties) -> VariableValue) -> MakeableField {
        .init(text: .init(value: factory(.text)))
    }
    
    enum Properties: String, CaseIterable, ViewProperty {
        case text
        
        var defaultValue: VariableValue {
            switch self {
            case .text: return "TEXT" as Value
            }
        }
    }
}


