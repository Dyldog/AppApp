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
    let fontSize: Int
    var onEdit: (() -> Void)?
    
    init(title: Value, fontSize: Int, action: [any StepType]) {
        self.title = title
        self.action = action
        self.fontSize = fontSize
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
                .font(.system(size: CGFloat(fontSize)))
        }).any
    }
    
    func value(for property: Properties) -> (VariableValue)? {
        switch property {
        case .title: return title //(&variables)
        case .fontSize: return fontSize
        case .action: return action
        }
    }
    
    static func make(factory: (Properties) -> VariableValue) -> MakeableButton {
        return .init(
            title: factory(.title) as! Value,
            fontSize: factory(.fontSize) as! Int,
            action: factory(.action) as! [any StepType]
        )
    }
    
    enum Properties: String, CaseIterable, ViewProperty {
        case title
        case fontSize
        case action
        
        var defaultValue: VariableValue {
            switch self {
            case .title: return "TITLE" as Value
            case .fontSize: return 12
            case .action: return [any StepType]()
            }
        }
    }
}
    
extension MakeableButton: Codable {
    enum CodingKeys: String, CodingKey {
        case title
        case fontSize
        case action
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(Value.self, forKey: .title)
        fontSize = try container.decode(Int.self, forKey: .fontSize)
        action = try container.decode(CodableStepList.self, forKey: .action).steps
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(CodableStepList(steps: action), forKey: .action)
        try container.encode(fontSize, forKey: .fontSize)
    }
}
