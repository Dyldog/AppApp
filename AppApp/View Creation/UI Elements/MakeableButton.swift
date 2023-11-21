//
//  MakeableButton.swift
//  AppApp
//
//  Created by Dylan Elliott on 21/11/2023.
//

import SwiftUI

struct MakeableButton: MakeableView {
    let title: Value
    let action: [any StepType]
    var onEdit: (() -> Void)?
    
    init(title: Value, action: [any StepType]) {
        self.title = title
        self.action = action
    }
    
    func view(variables: Binding<Variables>?, alert: Binding<Alert?>?) throws -> AnyView {
        let titleString: String
        if var variables = variables?.wrappedValue {
            guard let value = try title.value(with: &variables) else {
                throw VariableValueError.valueNotFoundForVariable
            }
            titleString = value.valueString
        } else {
            titleString = title.protoString
        }
        
        return SwiftUI.Button(action: {
            if let variables = variables {
                do {
                    try action.forEach {
                        try $0.run(with: &variables.wrappedValue)
                    }
                } catch {
                    alert?.wrappedValue = .init(title: "Error", message: error.localizedDescription)
                }
            }
        }, label: {
            Text(titleString)
        }).any
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .title: return title //(&variables)
        case .action: return action
        }
    }
    
    static func make(factory: (Properties) -> VariableValue) -> MakeableButton {
        let title = factory(.title) as! Value
        return .init(
            title: title,
            action: factory(.action) as! [any StepType]
        )
    }
    
    enum Properties: String, CaseIterable, ViewProperty {
        case title
        case action
        
        var defaultValue: VariableValue {
            switch self {
            case .title: return "TITLE" as Value
            case .action: return [any StepType]()
            }
        }
    }
}
    
