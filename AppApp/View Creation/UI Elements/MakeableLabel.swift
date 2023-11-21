//
//  MakeableLAbel.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct MakeableLabel: MakeableView {
    let text: VariableValue
    var onEdit: (() -> Void)?
    
    func view(variables: Binding<Variables>?, alert: Binding<Alert?>?) throws -> AnyView {
        if var variables = variables?.wrappedValue {
            guard let value = try text.value(with: &variables)?.valueString
            else { throw VariableValueError.valueNotFoundForVariable }
            return Text(value).any
        } else {
            return Text(text.protoString).any
        }
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .value: return text
        }
    }
    
    static func make(factory: (Properties) -> VariableValue) -> MakeableLabel {
        .init(text: factory(.value))
    }
    
    enum Properties: String, CaseIterable, ViewProperty {
        case value
        
        var defaultValue: VariableValue {
            switch self {
            case .value: return "TEXT" as Value
            }
        }
    }
}

